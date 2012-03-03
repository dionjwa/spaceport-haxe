define( function(){
	var SoundManager = sp.Class.create( 'SoundManager', {
		statics: {
		    loadPreferences: function loadPreferences(){
		        SoundManager.preferences = sp.SharedObject.getLocal("soundPrefs");
	        },
	        musicMuted: {
	            get: function get_musicMuted(){
	                return SoundManager.preferences.data.musicMuted;
                },
                set: function set_musicMuted(value){
                    SoundManager.preferences.data.musicMuted = value;
                    SoundManager.preferences.flush();
                    
                    if( !value && SoundManager.backgroundMusic ){
                        SoundManager.resumeBackgroundMusic();
                    }else if( value && SoundManager.musicPlaying ){
                        SoundManager.pauseBackgroundMusic();
                    }
                }
            },
            soundEffectsMuted: {
                get: function get_soundEffectsMuted(){
                    return SoundManager.preferences.data.soundEffectsMuted;
                },
                set: function set_soundEffectsMuted(value){
                    SoundManager.preferences.data.soundEffectsMuted = value;
                    SoundManager.preferences.flush();
                }
            },
            musicPaused: {
                get: function get_musicPaused(){
                    return (SoundManager.backgroundMusicChannel === null) && (SoundManager.backgroundMusic);
                }
            },
            musicPlaying: {
                get: function get_musicPlaying(){
                    return (SoundManager.backgroundMusic !== null);
                }
            },
		    preferences: null,
			resources: {},
			openChannels: [],
			backgroundMusic: null,
			backgroundMusicChannel: null,
			backgroundMusicPausePosition: 0,
			addResource: function addResource(key, sound){
				SoundManager.resources[key] = sound;
			},
			playSoundEffect: function playSoundEffect(key){
			    if( SoundManager.soundEffectsMuted )
			        return;
			        
				var soundChannel = SoundManager.resources[key].play();
				if( SoundManager.openChannels.length >= 32 )
					throw new Error("Cannot have more than 32 open Sound Channels at once");
				
				SoundManager.openChannels.push( soundChannel );
				soundChannel.addEventListener( sp.Event.SOUND_COMPLETE, function(event){
					var idx = SoundManager.openChannels.indexOf( soundChannel );
					SoundManager.openChannels.splice( idx, 1 );
					event.currentTarget.removeEventListener( event.type, arguments.callee );
				});
				return soundChannel;
			},
			startBackgroundMusic: function startBackgroundMusic(key){
				if( SoundManager.backgroundMusicChannel ){
					var currentlyPlayingBackgroundMusic = SoundManager.backgroundMusicChannel;
					currentlyPlayingBackgroundMusic.stop();
				}
				SoundManager.backgroundMusic = SoundManager.resources[key];
				if( SoundManager.musicMuted )
			        return null;
				var soundChannel = SoundManager.backgroundMusic.play(0, 999);
				SoundManager.backgroundMusicChannel = soundChannel;
				return soundChannel;
			},
			pauseBackgroundMusic: function pauseBackgroundMusic(){
				SoundManager.backgroundMusicPausePosition = SoundManager.backgroundMusicChannel.position;
				SoundManager.backgroundMusicChannel.stop();
				SoundManager.backgroundMusicChannel = null;
			},
			resumeBackgroundMusic: function resumeBackgroundMusic(){
				var soundChannel = SoundManager.backgroundMusic.play(SoundManager.backgroundMusicPausePosition, 999);
				SoundManager.backgroundMusicChannel = soundChannel;
				return soundChannel;
			}
		}
	});
	return SoundManager;
});
