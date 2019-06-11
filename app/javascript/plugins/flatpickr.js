import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  altFormat: "d F Y",
})

flatpickr(".meetpicker", {
  altInput: true,
  allowInput: true,
  altFormat: "d F Y",
})

flatpickr(".hourpicker", {
  altInput: true,
  noCalendar: true,
  enableTime: true,
  allowInput: true,
  altFormat: "H:i",
  time_24hr: true,
  minTime: "08:00",
  maxTime: "20:00",
})
