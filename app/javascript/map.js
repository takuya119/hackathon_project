const haversine_distance = (center, facility) => {
  const { latitude: facLat, longitude: facLng } = facility;
  R = 6371.071;
  const rlat1 = center.lat * (Math.PI / 180);
  const rlat2 = parseFloat(facLat) * (Math.PI / 180);
  const difflat = rlat2 - rlat1;
  const difflon = (parseFloat(facLng) - center.lng) * (Math.PI / 180);

  const d =
    2 *
    R *
    Math.asin(
      Math.sqrt(
        Math.sin(difflat / 2) * Math.sin(difflat / 2) +
        Math.cos(rlat1) *
        Math.cos(rlat2) *
        Math.sin(difflon / 2) *
        Math.sin(difflon / 2)
      )
    );
  return d;
};

const center = { lat: 35.67337556092948, lng: 139.81827882218855 }; // 江東区の中心の緯度経度
const facilities = gon.searchInfo['facilities'];

window.initMap = () => {
  const map = new google.maps.Map(document.getElementById('map'), {
    center,
    zoom: 13,
    mapTypeControl: false,
    streetViewControl: false,
    fullscreenControl: false
  });

  new google.maps.Marker({
    map,
    position: center,
  });

  const select = document.getElementById('js-radius-select');
  const filteredFacilities = facilities.filter(
    (facility) => haversine_distance(center, facility) < select.value / 1000
  );

  let infoWindow;
  const setMarker = (facility) => {
    const coordinatesMarker = new google.maps.LatLng({
      lat: parseFloat(facility.latitude),
      lng: parseFloat(facility.longitude)
    });

    const marker = new google.maps.Marker({
      position: coordinatesMarker,
      map,
      icon: 'https://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
    });

    marker.addListener('click', () => {
      if (infoWindow) {
        infoWindow.close();
      }
      infoWindow = new google.maps.InfoWindow({
        content: `${facility.name}<br><a href="/facilities/${facility.id}">詳細ページ</a>`
      });
      infoWindow.open(map, marker);
    });

    return marker
  };

  let markers = filteredFacilities.map((facility) => setMarker(facility));

  const getRadius = () => {
    return parseInt(select.value)
  };

  const newCircle = () => {
    return new google.maps.Circle({
      map,
      center,
      radius: getRadius(),
      clickable: false,
      fillColor: '#f0ffff',
      strokeColor: '#87cefa'
    });
  };

  let circle = newCircle();

  select.onchange = () => {
    circle.setMap(null);
    circle = newCircle();

    markers.map((marker) => marker.setMap(null));
    const newFilteredFac = facilities.filter(
      (facility) => haversine_distance(center, facility) < select.value / 1000
    );

    markers = newFilteredFac.map((facility) => setMarker(facility));
  }
}

roomTag = gon.searchInfo['room_tags']
tagForm = document.getElementById('q_rooms_room_tags_tag_name_matches_all')
tagList = document.getElementById('js-tag-list')

tagForm.addEventListener("input", () => {
  if (!tagForm.value) {
    return;
  }

  while (tagList.firstChild) {
    tagList.removeChild(tagList.firstChild);
  }

  regValue = new RegExp(tagForm.value);
  matchTags = roomTag.filter((r) => r.match(regValue))

  matchTags.forEach(tag => {
    li = document.createElement('li')
    li.innerHTML = tag
    li.className = 'd-inline me-2';
    tagList.appendChild(li);

    li.addEventListener("click", () => {
      tagForm.value = tag
    })
  });
});
