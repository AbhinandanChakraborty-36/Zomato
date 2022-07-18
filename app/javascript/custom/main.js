function initMap() {
    // The location of Uluru
    // console.log()
    // console.log()
  let lati= document.getElementById("restId1")
  let longi=document.getElementById("restId2")
  const uluru = {lat: parseFloat(lati.textContent), lng: parseFloat(longi.textContent)}
    // const uluru2 = { lat: , lng: 88.3744314 };
    // The map, centered at Uluru
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 15,
      center: uluru,
    });
    // The marker, positioned at Uluru
    const marker = new google.maps.Marker({
      position: uluru,
      map: map,
    });
  
  }
  
  window.initMap = initMap;
