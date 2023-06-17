export default {
  "rest-cache": {
    config: {
      provider: {
        name: "memory",
        options: {
          max: 32767,
          maxAge: 3600,
        },
      },
      strategy: {
        keysPrefix: "nv-cms",
        maxAge: 3600000,
        debug: true,
        contentTypes: [
          // list of Content-Types UID to cache
          // "api::category.category",
          // "api::article.article",
          // "api::global.global",
          // "api::homepage.homepage",
        ],
      },
    },
  },

  seo: {
    enabled: true,
  },
};
