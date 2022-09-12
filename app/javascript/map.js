import Swiper from 'swiper/bundle';

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
  // 開いているinfo windowがあったら閉じて、新しいinfo windowを開く関数
  const openInfoWindow = (facility, marker) => {
    if (infoWindow) {
      infoWindow.close();
    }
    infoWindow = new google.maps.InfoWindow({
      content: `${facility.name}<br><a href="/facilities/${facility.id}">詳細ページ</a>`
    });
    infoWindow.open(map, marker);
  }

  // クリックしたらinfo windowが開くマーカーを設置する関数
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
      openInfoWindow(facility, marker)
    });

    marker.facilityId = facility.id
    return marker
  };

  let markers = facilities.map((facility) => setMarker(facility));

  // selectに入っている値を取得する関数
  const getRadius = () => {
    return parseInt(select.value)
  };

  // selectに入っている値を半径にしたサークルを作成する関数
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

  let circle
  facilitiesDiv = facilities.map((facility) => {
    return document.getElementById(`js-facility-${facility.id}`)
  });

  select.onchange = () => {
    if (circle) {
      circle.setMap(null);
    }

    if (select.value) {
      circle = newCircle();
      markers.map((marker) => marker.setMap(null));
      const newFilteredFac = facilities.filter(
        (facility) => haversine_distance(center, facility) < select.value / 1000
      );

      markers = newFilteredFac.map((facility) => setMarker(facility));

      const matchFacilitiesDiv = facilitiesDiv.filter((facDiv) => markers.find((marker) => facDiv.id === `js-facility-${marker.facilityId}`))
      updateMapSwiperFunction(matchFacilitiesDiv, markers, openInfoWindow)
    } else {
      markers = facilities.map((facility) => setMarker(facility));
      updateMapSwiperFunction(facilitiesDiv, markers, openInfoWindow)
    }
  }

  activeSlideOpenInfoWindow(markers, openInfoWindow);
  newSwiper();
}

// ピンをサークル内のみにする関数
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

// サークルを変更した際に行う処理をひとまとめにした関数
const updateMapSwiperFunction = (FacilitiesDiv, markers, executeFunction) => {
  replaceSwiperContainer(FacilitiesDiv);
  activeSlideOpenInfoWindow(markers, executeFunction);
  newSwiper();
}

// swiperを入れ替える関数
const replaceSwiperContainer = (replaceFacilitiesDiv) => {
  // 要素を作成し、クラスをもたせる関数
  const createElementAndClass = (elementName, className) => {
    const newElement = document.createElement(elementName)
    newElement.className = className
    return newElement
  };
  // 要素を作成し、クラスをもたせ、指定した親に追加する関数
  const createElementAppendChild = (elementName, className, parent) => {
    const newElement = createElementAndClass(elementName, className);
    parent.appendChild(newElement);
    return newElement
  };

  const swiperContainer = createElementAndClass('div', 'container mb-5');
  swiperContainer.id = 'js-swiper-container'
  const swiperDiv = createElementAppendChild('div', 'swiper mySwiper mt-3 col-sm-7', swiperContainer);
  const swiperWrapperDiv = createElementAppendChild('div', 'swiper-wrapper', swiperDiv);

  replaceFacilitiesDiv.map((facDiv) => {
    swiperWrapperDiv.appendChild(facDiv);
  });

  createElementAppendChild('div', 'swiper-button-next', swiperDiv);
  createElementAppendChild('div', 'swiper-button-prev', swiperDiv);
  createElementAppendChild('div', 'swiper-pagination pagination-width', swiperDiv);

  document.getElementById('js-swiper-container').replaceWith(swiperContainer)
};

// 表示されているスライドのinfo windowが開く関数
const activeSlideOpenInfoWindow = (markers, executeFunction) => {
  const swiperWrapper = document.getElementsByClassName('swiper-wrapper')[0]
  const activeSlideObservation = new MutationObserver(() => {
    if (swiperWrapper.style.cssText === 'transition-duration: 0ms;') {
      const activeSlideFacilityId = document.getElementsByClassName('swiper-slide-active')[0].id.replace('js-facility-', '')
      const activeSlideMarker = markers.find((marker) => marker.facilityId === parseInt(activeSlideFacilityId));
      const activeSlideFacility = facilities.find((facility) => facility.id === parseInt(activeSlideFacilityId));
      executeFunction(activeSlideFacility, activeSlideMarker);
    }
  });
  activeSlideObservation.observe(swiperWrapper, {
    attributes: true
  });
}

// swiperクラスに機能をつける関数
const newSwiper = () => {
  new Swiper(".mySwiper", {
    loop: true,
    grabCursor: true,
    effect: "creative",
    creativeEffect: {
      prev: {
        shadow: true,
        translate: ["-120%", 0, -500],
      },
      next: {
        shadow: true,
        translate: ["120%", 0, -500],
      },
    },
    pagination: {
      el: ".swiper-pagination",
      type: "progressbar",
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    },
  });
};

// タグ補完機能
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
