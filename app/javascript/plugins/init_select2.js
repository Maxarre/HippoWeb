import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: {
        id: '0', // the value of the option
        text: 'None Selected'
      },
  });
};

export { initSelect2 };
