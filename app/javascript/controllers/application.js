import { Application } from "@hotwired/stimulus"
import './dropdown_toggle';

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

document.addEventListener('DOMContentLoaded', () => {
  const postsSection = document.getElementById('posts-section');
  const savedPostsSection = document.getElementById('saved-posts-section');
  const showPosts = document.getElementById('show-posts');
  const showSavedPosts = document.getElementById('show-saved-posts');

  if (showPosts && showSavedPosts) {
    showPosts.addEventListener('click', (e) => {
      e.preventDefault();
      postsSection.style.display = 'block';
      savedPostsSection.style.display = 'none';
    });

    showSavedPosts.addEventListener('click', (e) => {
      e.preventDefault();
      postsSection.style.display = 'none';
      savedPostsSection.style.display = 'block';
    });
  }
});