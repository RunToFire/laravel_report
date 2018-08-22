/*
  Copyright mydbr.com http://www.mydbr.com
  You are free to modify this file
*/

var Google_map = {
  map : null,
  points: [],
  is_route: false,
  /*
    Initializing the new map
  */
  init_map: function( id, x, y, zoom, type, is_route ) {
    var map_type, latlng = new google.maps.LatLng(x, y);
    switch (type) {
      case 'satellite':
        map_type = google.maps.MapTypeId.SATELLITE;
        break;
      case 'terrain':
        map_type = google.maps.MapTypeId.TERRAIN;
        break;
      case 'hybrid':
        map_type = google.maps.MapTypeId.HYBRID;
        break;
      default:
        map_type = google.maps.MapTypeId.ROADMAP;
        break;
    }

    var options = {
      zoom: zoom,
      center: latlng,
      mapTypeControl: true,
      mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
      navigationControl: true,
      mapTypeId: map_type
    };
  
    this.map = new google.maps.Map(document.getElementById('map'+id), options);
    this.points = [];
    this.is_route = is_route;
    
    return this.map;
  },
  polyline: function(color) {
    var lat, lng, coords = [], poly;
  
    for(var i=0; i<this.points.length; i++) {
      lat = this.points[i].lat();
      lng = this.points[i].lng();
    
      coords.push({"lat":lat,"lng":lng});
    }
    poly = new google.maps.Polyline({
      path: coords,
      geodesic: true,
      strokeColor: color,
      strokeWeight: 2
    });
    poly.setMap(this.map);
  },
  route: function(mode) {
    var p_from, p_to,
      directionsService = new google.maps.DirectionsService(),
    themap = this.map, waypoints = [], origin, destination;
    
    mode = mode.toUpperCase();
    if (!['DRIVING','WALKING','BICYCLING','TRANSIT'].includes(mode)) {
      window.alert('TravelMode should be driving, walking, bicycling or transit, not ' + mode);
    }
    
    origin = {
      "lat":this.points[0].lat(),
      "lng":this.points[0].lng()
    };
    destination = {
      "lat":this.points[this.points.length-1].lat(),
      "lng":this.points[this.points.length-1].lng()
    };
    for(var p=1; p<this.points.length-1; p++) {
      waypoints.push(
        { 
          location: {
            "lat":this.points[p].lat(),
            "lng":this.points[p].lng()
          }, 
          stopover: true
        }
      );
    }
    directionsService.route({
      origin: origin,
      destination: destination,
      waypoints: waypoints,
      travelMode: google.maps.TravelMode[mode]
    }, function (response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        var directionsDisplay = new google.maps.DirectionsRenderer({ draggable: true, map: themap });
        directionsDisplay.setDirections(response);
      } else {
        if (status=='ZERO_RESULTS') {
          window.alert('Unable to define a '+mode.toLowerCase()+" route between points");
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      }
    });
    
  },
  /*
    Place a new marker to map. 
    noXY and noZoom will determine if the center and the zoom is done automatically or if the user set them
  
    iconFile can contain preinstalled icons (see markers and pushpins) or any image file reference with size/anchor position added to end (http://mypics.com/image.png:32:32::center)
  */
  new_marker: function( points_arr, lat, lon, desc, url, new_window, noXY, noZoom, iconFile, shadowFile, markerLabel ){
    var marker, newicon, markerInd, pushpinInd, iconSize;
    var markerbase = 'http://maps.google.com/mapfiles/ms/micons/';
    var markerOptions, image, icon_x, icon_y, icon_pos;
  
    // Inlcuded markers & pushpins
    var markers = [ 'blue', 'green', 'orange', 'pink', 'purple', 'red', 'yellow', 'blue-dot', 'green-dot', 'orange-dot', 'pink-dot', 'purple-dot', 'red-dot', 'yellow-dot' ];
    var pushpins = [ 'blue-pushpin', 'grn-pushpin', 'pink-pushpin', 'purple-pushpin', 'red-pushpin', 'yellow-pushpin' ];
  
    var point = new google.maps.LatLng(lat,lon);
  
  
    points_arr.push(point);
    this.points.push(point);
    if (this.is_route) {
      return;
    }
    if (iconFile!=='') {
      if ( (markerInd = jQuery.inArray(iconFile, markers))>=0 ||
         (pushpinInd = jQuery.inArray(iconFile, pushpins))>=0) {
      
        iconFile = markerbase+iconFile+".png";
        iconSize = google.maps.Size(32, 32);
      } else {
        var iconInfo = iconFile.split('::');
        if (iconInfo.length>=3 && iconInfo[0]!=='') {
          iconFile = iconInfo[0];
          icon_x = parseInt(iconInfo[1], 10);
          icon_y = parseInt(iconInfo[2], 10);
          iconSize = google.maps.Size( parseInt(iconInfo[1], 10), parseInt(iconInfo[2], 10));
          if (iconInfo.length>3) {
            icon_pos = iconInfo[3];
          }
        }
      }
      image = {
        url: iconFile,
        anchor: icon_pos == 'center' ? new google.maps.Point(icon_x/2, icon_y/2) : null, 
        scaledSize: icon_x && icon_y ? new google.maps.Size(icon_x, icon_y) : null
      };
    }
    marker= new google.maps.Marker({
      position: point,
      map: this.map,
      icon: image,
      label: markerLabel,
      url: url,
      new_window: new_window
    });

    var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
      if (marker.url) {
        if (new_window) {
          window.open(marker.url);
        } else {
          document.location.href = marker.url;
        }
      } else {
        infowindow.setContent(desc);
        infowindow.open(this.map,marker);
      }
    });
  },
  set_bounds: function( points, noXY, noZoom, zoom )
  {
    var i;
  
    if (noXY || noZoom ) {
      var bounds = new google.maps.LatLngBounds();

      for (i=0; i < points.length; i++) {
          var ll = new google.maps.LatLng(points[i].lat(), points[i].lng());
          bounds.extend(ll);
      }
    
      if (points.length==1 && this.map.getZoom()===0) {
        if (noXY) {
          this.map.setCenter(bounds.getCenter());
        }
        if (noZoom) {
          this.map.setZoom(7);
        }
      } else {
        this.map.fitBounds(bounds);
      }
    }
  },
  fix_zoom: function(zoom) 
  {
    var map = this.map;
    var listener = google.maps.event.addListener(map, "idle", function() {
      if (map.getZoom() !== zoom) map.setZoom(zoom);
        google.maps.event.removeListener(listener);
    });
  },
  get_map_object: function(resultclass)
  {
    var id = $('.'+resultclass).find('.mydbr_googlemap').attr('id');
    if (id) {
      return window['ext_gm_'+id];
    } else {
      return null;
    }
  } 
};

