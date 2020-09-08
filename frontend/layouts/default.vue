<template lang="pug">
div
  nav.navbar.header.has-shadow.is-primary(role='navigation', aria-label='main navigation')
    .navbar-brand
      a.navbar-item(href='/')
        svg(xmlns="http://www.w3.org/2000/svg" width="78" height="16" viewBox="0 0 78 16")
          path(d="M46.2-150.8a3.836,3.836,0,0,0,4,3.8,3.836,3.836,0,0,0,4-3.8v-9h3.2v9a6.873,6.873,0,0,1-7.2,6.8,6.873,6.873,0,0,1-7.2-6.8v-9h3.2Zm20.6,6.6H63.6V-160l11.2,9.4v-9.2H78V-144l-11.2-9.4Zm-51,0H12.2l-4.3-8.6-4.3,8.6H0L7.9-160Zm21,0H33.6v-9.2l-4.8,4.029L24-153.4v9.2H20.8V-160l8,6.714,8-6.714Z" transform="translate(0 160)" fill="#fff" fill-rule="evenodd")
      .navbar-burger
        span
          span
            span
  section.main-content.columns
    aside.column.is-2.section
      p.menu-label.is-hidden-touch General
      ul.menu-list
        li(v-for='(item, key) of items', :key='key')
          nuxt-link(:to='item.to', exact-active-class='is-active')
            b-icon(:icon='item.icon')
            |  {{ item.title }}
    .container.column.is-10
      nuxt
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          title: 'Home',
          icon: 'home',
          to: { name: 'index' },
        },
      ],
    }
  },
}
</script>
