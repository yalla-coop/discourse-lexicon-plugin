import { on } from "@ember/modifier";
import routeAction from "discourse/helpers/route-action";
import { i18n } from "discourse-i18n";

const BaseDeeplinkTemplate = <template>
  <h1>{{i18n "deeplink.title"}}</h1>
  <button
    type="button"
    id="open-in-lexicon-app"
    class="btn btn-primary"
    {{on "click" (routeAction "open" @model.link)}}
  >
    {{#if @model.redirect_to_app}}
      {{i18n "deeplink.button_label_open_app"}}
    {{else}}
      {{#if @model.is_pm}}
        {{i18n "deeplink.button_label_view_message"}}
      {{else}}
        {{i18n "deeplink.button_label_view_post"}}
      {{/if}}
    {{/if}}
  </button>
</template>;

export default BaseDeeplinkTemplate;
