import { Turbo } from "@hotwired/turbo-rails";
import "./controllers";

window.Turbo = Turbo;

// Morph Turbo Frame rendering to allow navigation within Turbo Frames
// without having to teardown the entire frame. This is needed to prevent
// the leaving and entering animations from repeating when navigating
// within the modal. You could optionally not use the code below if you
// do not intend to allow navigation within the modal.
//
// Note that Turbo 8 will include Idiomorph by default.
//
// In the meantime, add `<script src="https://unpkg.com/idiomorph"></script>`
// to your HTML <head>.
addEventListener("turbo:before-frame-render", (event) => {
  event.detail.render = (currentElement, newElement) => {
    Idiomorph.morph(currentElement, newElement, {
      morphstyle: 'innerHTML'
    })
  }
})
