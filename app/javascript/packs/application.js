// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Chart from 'chart.js/auto';
global.Chart = Chart;
import 'chartjs-adapter-date-fns';
import 'chartjs-plugin-annotation';
// Chart.register(annotationPlugin);

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
// import "channels";
import "@rails/actioncable";

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application.scss";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

