let navigating = false;
let navigations = {};
let transitionEnded = true;
let transitionEndHandlers = [];

function waitUntilTransitionEnd() {
  return new Promise((resolve) => {
    if (transitionEnded) {
      resolve();
    } else {
      transitionEndHandlers.push(resolve);
    }
  });
}

async function fetchContent(path) {
  let request = await fetch(`/content${path}`);
  return await request.text();
}

function postNavigation(elements) {
  document.title = `circl - ${document.querySelector("#articleContainer circl-title").innerText}`;
  scrollTo(0, 0);
  articleContainer.classList.remove("loading");
  
  for (let element of elements) {
    if (!element.target && element.origin == location.origin) {
      element.addEventListener("click", (e) => {
        if (e.button == 0) {
          e.preventDefault();
          navigate(element.pathname, true);
        }
      });
    }
  }
}

function navigate(path, willPushState) {
  if (willPushState) {
    history.pushState({}, "", path);
  }
  
  if (!navigations[path]) {
    navigations[path] = true;
    
    if (!navigating) {
      navigating = true;
      
      articleContainer.classList.add("loading");
      
      transitionEnded = false;
      setTimeout(() => {
        transitionEnded = true;
        for (let handler of transitionEndHandlers) {
          handler();
        }
        transitionEndHandlers = [];
      }, 125);
    }
    
    fetchContent(path).then(async (r) => {
      await waitUntilTransitionEnd();
      
      if (location.pathname == path) {
        navigating = false;
        articleContainer.innerHTML = r;
        postNavigation(document.querySelectorAll("article a"));
      } else {
        console.log(`Rejected stale navigation to ${path}`);
      }
      
      delete navigations[path];
    });
  } else {
    console.log(`Rejected duplicate navigation to ${path}`);
  }
}

addEventListener("popstate", (e) => {
  navigate(location.pathname, false);
});

postNavigation(document.querySelectorAll("a"));
