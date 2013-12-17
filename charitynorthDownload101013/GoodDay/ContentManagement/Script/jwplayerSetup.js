
		jwplayer("mediaplayer").setup({
		  flashplayer: "jwplayer/jwplayer.swf",
		  playlist: [{
				file: "Media/wheelchairrace.flv",
			  image: "Media/example.jpg",
			  title: "Wheel Chair Race",
			  duration: 5},
			  {
				file: "Media/wheelchairrace.flv",
			  image: "Media/example.jpg",
			  title: "Wheel Chair Race",
			  duration: 15
			
			}],
			controlbar: "none",
			autostart: "true",
			icons: "false",
			stretch: "fill",
			width: 518,
			height: 296
//			events: {
//			  onComplete: function() { alert("the video is finished!"); }
//			}

	});

	  function addVideo(videoUrl, videoThumb, videoTitle) {
	    var playlist = jwplayer().getPlaylist();
	    var newItem = {
	    file: videoUrl,
	    image: videoThumb,
	    title: videoTitle
	  };
	  playlist.push(newItem); 
	  jwplayer().load(playlist); }

