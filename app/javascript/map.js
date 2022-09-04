const center = { lat: 35.67337556092948, lng: 139.81827882218855 }; // 江東区の中心の緯度経度
const select = document.getElementById('js-radius-select');
const facilities = gon.searchInfo['facilities'];
let markers = [];
let infoWindows = [];

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

  for (let i = 0; i < facilities.length; i++) {
    const coordinatesMarker = new google.maps.LatLng({ lat: parseFloat(facilities[i]['latitude']), lng: parseFloat(facilities[i]['longitude']) });
    markers[i] = new google.maps.Marker({
      position: coordinatesMarker,
      map: map,
      icon: 'https://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
    });

    infoWindows[i] = new google.maps.InfoWindow({
      content: `${facilities[i].name}<br><a href="/facilities/${facilities[i].id}">詳細ページ</a>`
    });

    markerEvent(i);
  }

  function markerEvent(i) {
    markers[i].addListener('click', () => {
      infoWindows[i].open(map, markers[i]);
      for (let n = 0; n < facilities.length; n++) {
        if (n === i) {
          continue;
        }
        infoWindows[n].close();
      }
    });
  }

  circle = new google.maps.Circle({
    map: map,
    center: center,
    radius: 3000,
    clickable: false,
    fillColor: '#f0ffff',
    strokeColor: '#87cefa'
  });

  select.onchange = () => {
    circle.setMap(null);

    radius = parseInt(select.value)
    circle = new google.maps.Circle({
      map: map,
      center: center,
      radius: radius,
      clickable: false,
      fillColor: '#f0ffff',
      strokeColor: '#87cefa'
    });
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
