(ns docker-clj.routes.home
            (:require [docker-clj.layout :as layout]
                      [docker-clj.util :as util]
                      [compojure.core :refer :all]
                      [noir.response :refer [edn]]
                      [clojure.pprint :refer [pprint]]))

(defn home-page []
      (layout/render
        "app.html" {:docs (util/md->html "/md/docs.md")}))

(defn save-document [doc]
      (pprint doc)
      {:status "ok"})

(defroutes home-routes
  (GET "/" [] (home-page))
  (POST "/save" {:keys [body-params]}
    (edn (save-document body-params))))
