// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_quality_rating').barrating({
    theme: 'css-stars'
  });
  $('#review_security_rating').barrating({
    theme: 'css-stars'
  });
  $('#review_fun_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };