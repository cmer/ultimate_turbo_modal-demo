import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// And add these lines below it:
import setupUltimateTurboModal from "ultimate_turbo_modal";
setupUltimateTurboModal(application);
