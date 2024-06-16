import { Controller } from "stimulus";
import { Loader } from "@googlemaps/js-api-loader";

export default class extends Controller {
  static targets = ["map"];

  connect() {
    if(this.hasMapTarget) {
      let lat = parseFloat(this.mapTarget.dataset.lat);
      let lng = parseFloat(this.mapTarget.dataset.lng);
      this.initializeMap(lat, lng);
    }
  }

  async initializeMap(lat, lng) {
    const loader = new Loader({
      apiKey: "",
      version: "weekly"
    });
    const google = await loader.load();
    const position = { lat: lat, lng: lng }
    const mapOptions = { center: position, zoom: 15 };

    this.map = new google.maps.Map(this.mapTarget, mapOptions);

    new google.maps.Marker({
      position: position,
      map: this.map,
    });
  }
}
