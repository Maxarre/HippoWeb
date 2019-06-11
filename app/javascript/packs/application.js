import "bootstrap";
import "../plugins/flatpickr";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/init_select2';
import { removeTag } from '../plugins/remove_tag';
import { initAjax } from '../components/init_ajax';

initSelect2();
removeTag();

import $ from 'jquery';

window.$ = $

global.initAjax = initAjax;
