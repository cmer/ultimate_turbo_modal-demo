const defaultTheme = require('tailwindcss/defaultTheme')
// With npm/yarn
// const { getUltimateTurboModalPath } = require('ultimate_turbo_modal/gemPath');

// With importmaps
const { execSync } = require('child_process');

function getUltimateTurboModalPath() {
  const path = execSync('bundle show ultimate_turbo_modal').toString().trim();
  return `${path}/**/*.{erb,html,rb}`;
}

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim,rb}',
    getUltimateTurboModalPath()
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  darkMode: 'class',
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ]
}
