let navigating = false;
let navigations = {};
let transitionPromise;

function wait(time) {
  return new Promise((resolve) => {
    setTimeout(resolve, time);
  });
}

async function fetchContent(path) {
  let request = await fetch(`/content${path}`);
  return await request.text();
}

function setTitle() {
  document.title = `circl - ${document.querySelector("#articleContainer circl-title").innerText}`;
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
      transitionPromise = wait(125);
    }
    
    Promise.all([transitionPromise, fetchContent(path)]).then((r) => {
      if (location.pathname == path) {
        navigating = false;
        articleContainer.innerHTML = r[1];
        setTitle();
        scrollTo(0, 0);
        articleContainer.classList.remove("loading");
      } else {
        console.log(`Rejected stale navigation to ${path}`);
      }
      
      delete navigations[path];
    });
  } else {
    console.log(`Rejected duplicate navigation to ${path}`);
  }
}

document.body.addEventListener("click", (e) => {
  if (e.target.tagName == "A" &&
      !e.target.target &&
      e.target.origin == location.origin) {
    e.preventDefault();
    navigate(e.target.pathname, true);
  }
});

addEventListener("popstate", (e) => {
  navigate(location.pathname, false);
});

setTitle();
