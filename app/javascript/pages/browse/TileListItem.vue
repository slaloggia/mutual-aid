<template>
  <li class="tileListItem box is-paddingless">
    <div class="header">
      <div class="tags">
        <div class="right-tags tags">
          <div class="left-tags">
            <TagList :tags="category_tags" class="categoryTags" tagClasses="tag is-info is-light subtitle is-5" />
          </div>
        </div>
      </div>
    </div>

    <div class="body">
      <div class="row left">
        <SingleIcon :iconType="contribution_type" klass="" />
        <MappedIconList :iconTypes="iconList" />
        <span class="has-text-right">
          <b-tag v-if="urgency" :class="urgencyColor">
            <b-icon v-if="showUrgentIcon" icon="exclamation-triangle" size="is-small" />
            {{ urgency.name }}
          </b-tag>
        </span>
      </div>

      <div class="text">
        <div>
          <small><time :datetime="createdAtDate.toISOString()">{{ createdAtDate.toLocaleDateString() }} {{ createdAtDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) }}</time></small>
        </div>
        <h5 class="has-text-weight-bold">{{ title }}</h5>
        <p>{{ description }}</p>
        <div v-if="service_area" class="has-text-grey-lighter">
          {{ service_area.name }}
        </div>
      </div>
    </div>
    <div class="actions">
      <div class="buttonSpacing" v-if="respond_path">
        <a :href="respond_path" class="button icon-list is-primary"><span class=""> Respond</span></a>
      </div>
    </div>
  </li>
</template>

<script>
import TagList from 'components/TagList'
import MappedIconList from 'components/MappedIconList'
import SingleIcon from 'components/SingleIcon'

export default {
  props: {
    contribution_type: String,
    category_tags: {type: Array, default: () => []},
    service_area: {type: Object, default: null},
    title: String,
    inexhaustible: Boolean,
    description: String,
    created_at: Number,
    urgency: Object,
    contact_types: {type: Array, default: () => []},
    profile_path: String,
    respond_path: String,
    match_path: String
  },
  components: {
    TagList,
    SingleIcon,
    MappedIconList,
  },
  computed: {
    showUrgentIcon() {
      return !(this.urgency && this.urgency.id > 1)
    },
    iconList() {
      return this.inexhaustible ? [ ...this.contact_types, {name: 'Inexhaustible'} ] : this.contact_types
    },
    urgencyColor() {
      return this.showUrgentIcon ? 'is-light is-warning' : ''
    },
    createdAtDate() {
      return new Date(this.created_at)
    }
  },
}
</script>

<style lang="scss" scoped>
@import 'bulma/sass/utilities/_all';

.tileListItem {
  @include tablet {
    margin-left: 0.5rem;
    margin-right: 0.5rem;
    display: flex;
    flex-direction: column;
  }
}

.header {
  display: flex;
  flex-wrap: wrap;
  padding: 0.2rem 0.3rem 0.3rem;
  &--withShadow {
    /*box-shadow: 0px 0.1rem 0.1rem rgba(0, 0, 0, 0.2);*/
  }
  & div {
    margin-top: 0.1rem;
  }
  & .left-tags {
    flex-grow: 1;
  }
}
.body {
  padding: 0.3rem;
  /*box-shadow: 0px 0.1rem 0.1rem rgba(0, 0, 0, 0.2);*/
  flex: auto;
}
.text {
  margin: 0.2rem;
}
.row {
  display: flex;
  flex-wrap: wrap;
  padding: 0.2rem 0.3rem 0.3rem;
}

.actions {
  margin: 0.1rem;
}

.buttonSpacing {
  display: inline-block;
  margin: 0.1rem;
}
small {
  font-size: small;
  font-style: italic;
}
</style>
