const carousel = document.querySelector(".music .carousel");
const items = document.querySelectorAll(".music .carousel > li");
const links = document.querySelectorAll(".music-paginator li a");

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        links.forEach((a) => a.classList.remove("active"));
        const active = document.querySelector(
          `.music-paginator a[href="#${entry.target.id}"]`,
        );
        active?.classList.add("active");
      }
    });
  },
  {
    root: carousel,
    threshold: 0.6,
  },
);

items.forEach((item) => observer.observe(item));
