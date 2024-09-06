import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {

  findNear(){
    let lat = 0;
    let lng = 0;
    const url =new URL(window.location.href);

    if ((!url.searchParams.has("lat") || !url.searchParams.has("lng"))){
      navigator.geolocation.getCurrentPosition(
        (data)=> {
          lat = data.coords.latitude;
          lng = data.coords.longitude;

          url.searchParams.set("lat", lat);
          url.searchParams.set("lng", lng);

          window.location.href = url;
        });
      } 
  }

}
