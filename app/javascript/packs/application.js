import "bootstrap";
import "../plugins/flatpickr";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/init_select2';

initSelect2();

import $ from 'jquery';

window.$ = $

$('.js-example-basic-multiple').select2()
