function post (){
  const hamburger = document.querySelector('.burger');
  const navLinks = document.querySelector('.hamburger');
  const links = document.querySelectorAll('.hamburger li');

  hamburger.addEventListener('click', () => {
  navLinks.classList.toggle('nav-active');
  links.forEach((link, index) => {
    if (link.style.animation) {
      link.style.animation = '';
    } else {
      link.style.animation = `navLinksFade 0.5s ease forwards ${index / 7 + 0.3}s`;
      }
    });
    hamburger.classList.toggle('toggle');
  });
};

window.addEventListener('load', post);