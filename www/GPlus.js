// constructor
function GPlus() {

}

GPlus.prototype.share = function(url, successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "GPlus", "share", [url]);
}

GPlus.install = function () {
  if (!window.plugins) {
    window.plugins = {};
  }

  window.plugins.gplus = new GPlus();
  return window.plugins.gplus;
};

cordova.addConstructor(GPlus.install);