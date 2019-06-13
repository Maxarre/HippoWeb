    import flatpickr from "flatpickr"
    import "flatpickr/dist/themes/material_blue.css" // Note this is important!

    flatpickr(".datepicker", {
      altInput: true,
      allowInput: true,
      altFormat: "d F Y",
    })

<<<<<<< HEAD
    flatpickr(".meetpicker", {
      altInput: true,
      allowInput: true,
      altFormat: "d F Y",
      time_24hr: true,
    })


    flatpickr(".timepicker",{
        enableTime: true,
        noCalendar: true,
        dateFormat: "H"
    })
=======
flatpickr(".meetpicker", {
  altInput: true,
  allowInput: true,
  altFormat: "d F Y",
  time_24hr: true,
})
>>>>>>> 7665ad5ea34b1e3938764c806b82289232d2dd45
