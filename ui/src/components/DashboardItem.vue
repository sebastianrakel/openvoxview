<script setup lang="ts">
const value = defineModel({ type: Number, required: true });
const suffix = defineModel('suffix', { type: String, required: false });
const caption = defineModel('caption', { type: String, default: '' });
const titleColor = defineModel('title_color', {
  type: String,
  default: 'dark',
});
const to = defineModel('to', {type: Object})
</script>

<template>
  <div class="col-xs-6 col-sm-3 col-lg-2">
    <div class="q-ma-xs">
      <q-card bordered class="full-height q-pa-none" flat>
        <q-card-section class="q-pa-none">
          <q-list>
            <q-item :clickable="to != null" :to="to">
              <q-item-section>
                <q-item-label :class="`text-h6 text-${titleColor} ellipsis`">{{ value }} {{ suffix }}</q-item-label>
                <q-item-label caption>{{ caption }}</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </q-card-section>
      </q-card>
    </div>
  </div>
</template>

<style scoped></style>
