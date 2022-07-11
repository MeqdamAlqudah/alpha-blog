import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

import "bootstrap"
import "../stylesheets/application"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
