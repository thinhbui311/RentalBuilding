import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Import and register all TailwindCSS Components
import { Alert, Modal, Tabs } from "tailwindcss-stimulus-components"
application.register("alert", Alert)
application.register("modal", Modal)
application.register("tabs", Tabs)

import MapController from "./map_controller";
application.register("map", MapController);
