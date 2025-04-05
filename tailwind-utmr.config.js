// With npm/yarn
// const { getUltimateTurboModalPath } = require('ultimate_turbo_modal/gemPath');

// With importmaps
const { execSync } = require('child_process');

function getUltimateTurboModalPath() {
  const path = execSync('bundle show ultimate_turbo_modal').toString().trim();
  return `${path}/**/*.{erb,html,rb}`;
}
// End of importmaps

module.exports = {
  content: [
    getUltimateTurboModalPath()
  ]
}
