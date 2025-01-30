let runningNavigation = false;
let navigationQueue = [];

function wait(time) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

function fetchText(path) {
  return new Promise(async (resolve) => {
    let request = await fetch(`/content${path}`);
    let text = await request.text();
    resolve(text);
  });
}

function postNavigation(elements) {
  scrollTo(0, 0);
  document.title = `circl - ${document.querySelector("#articleContainer circl-title").innerText}`;
  
  for (let element of elements) {
    if (element.origin == location.origin) {
      element.addEventListener("click", (e) => {
        if (e.button == 0) {
          e.preventDefault();
          addNavigation(element.pathname, true);
        }
      });
    }
  }
}

function addNavigation(path, willPushState) {
  navigationQueue.push({ path: path, willPushState: willPushState });
  
  if (!runningNavigation) {
    doNavigation();
  }
}

async function doNavigation() {
  runningNavigation = true;
  
  let navigation;
  let articleContainer = document.querySelector("#articleContainer");
  
  while (navigation = navigationQueue.shift()) {
    let textPromise = fetchText(navigation.path);
    
    if (navigation.willPushState) {
      history.pushState({}, "", navigation.path);
    }
    
    articleContainer.classList.add("loading");
    await wait(125);
    
    articleContainer.innerHTML = await textPromise;
    postNavigation(document.querySelectorAll("article a"));
    
    articleContainer.classList.remove("loading");
    await wait(125);
  }
  
  runningNavigation = false;
}

addEventListener("popstate", (e) => {
  addNavigation(location.pathname, false);
});

postNavigation(document.querySelectorAll("a"));
