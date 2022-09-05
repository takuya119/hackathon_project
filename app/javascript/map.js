const center = { lat: 35.67337556092948, lng: 139.81827882218855 }; // 江東区の中心の緯度経度
const facilities = gon.searchInfo['facilities'];

function initMap() {
  const map = new google.maps.Map(document.getElementById('map'), {
    center: center,
    zoom: 13,
    mapTypeControl: false,
    streetViewControl: false,
    fullscreenControl: false
  });

  new google.maps.Marker({
    map: map,
    position: center,
  });

  let infoWindow;
  let markers = facilities.map((facility) => {
    const coordinatesMarker = new google.maps.LatLng({ lat: parseFloat(facility['latitude']), lng: parseFloat(facility['longitude']) });
    const marker = new google.maps.Marker({
      position: coordinatesMarker,
      map,
      icon: 'https://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
    });

    marker.addListener('click', () => {
      if (infoWindow !== undefined) {
        infoWindow.close();
      }
      infoWindow = new google.maps.InfoWindow({
        content: `${facility.name}<br><a href="/facilities/${facility.id}">詳細ページ</a>`
      });
      infoWindow.open(map, marker);
    });

    return marker
  });

  const select = document.getElementById('js-radius-select');

  let getRadius = () => {
    return parseInt(select.value)
  };

  let newCircle = () => {
    return new google.maps.Circle({
      map,
      center,
      radius: getRadius(),
      clickable: false,
      fillColor: '#f0ffff',
      strokeColor: '#87cefa'
    });
  }

  let circle = newCircle();

  select.onchange = () => {
    circle.setMap(null);
    circle = newCircle();
  }
}

window.initMap = initMap;

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
  matchTag = roomTag.filter((r) => r.match(regValue))

  for (let i = 0; i < matchTag.length; i++) {
    li = document.createElement('li')
    li.innerHTML = matchTag[i]
    li.className = 'input-value-li d-inline me-2';
    tagList.appendChild(li);
  }

  addFuncLi = document.getElementsByClassName('input-value-li');
  for (let i = 0; i < addFuncLi.length; i++) {
    addFuncLi[i].addEventListener("click", () => {
      tagForm.value = addFuncLi[i].textContent
    })
  }
});
