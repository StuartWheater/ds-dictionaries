<script setup lang="ts">
import BlocklyView from './components/BlocklyView.vue'
</script>

<template>
  <header>
    <div class="wrapper">
      <BlocklyView/>
    </div>
  </header>
</template>

<style scoped>
header
{
  line-height: 1.5;
  max-height: 100vh;
}
</style>
