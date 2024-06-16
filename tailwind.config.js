module.exports = {
  content: [
    './app/components/**/*.html.erb',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/frontend/stylesheets/**/*.css',
    './app/frontend/**/*.{js,vue}'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
