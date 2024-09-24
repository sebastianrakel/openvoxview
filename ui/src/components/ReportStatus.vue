<script setup lang="ts">
import StatusButton from 'components/StatusButton.vue';
import { PropType } from 'vue';
import { PuppetReport } from 'src/puppet/models/puppet-report';
import EventCountBlock from 'components/EventCountBlock.vue';

const report = defineModel('report', {
  type: Object as PropType<PuppetReport>,
  required: true,
});
const inline = defineModel('inline', { type: Boolean, default: false });
</script>

<template>
  <div class="row">
    <StatusButton
      class="col-auto q-mr-sm"
      :status="report.status"
      :hash="report.hash"
      :certname="report.certname"
    />
    <div
      class="q-mr-sm event bg-grey-7 rounded-borders text-center content-center"
    >
      {{ report.getMetricsValue('resources', 'total') }}
      <q-tooltip>{{ $t('LABEL_RESOURCE', 2) }}</q-tooltip>
    </div>
    <EventCountBlock v-if="inline" :event_count="report.getEventCounts()" />
  </div>
  <div class="row" v-if="!inline">
    <EventCountBlock class="q-mt-sm" :event_count="report.getEventCounts()" />
  </div>
</template>

<style scoped>
.event {
  min-width: 32px;
  text-align: center;
}
</style>
