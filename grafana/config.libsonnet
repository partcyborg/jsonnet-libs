{
  _images+:: {
    grafana: 'grafana/grafana:7.4.0',
  },

  _config+:: {
    rootUrl: '',
    provisioningDir: '/etc/grafana/provisioning',
    port: 80,
    containerPort: 3000,
    labels+: {
      dashboards: {},
      datasources: {},
      notificationChannels: {},
    },
    grafana_ini+: {
      sections+: {
        server: {
          http_port: $._config.containerPort,
          router_logging: true,
          root_url: $._config.rootUrl,
        },
        analytics: {
          reporting_enabled: false,
        },
        users: {
          default_theme: 'light',
        },
        explore+: {
          enabled: true,
        },
      },
    },
  },

  withGrafanaIniConfig(config):: {
    _config+:: {
      grafana_ini+: config,
    },
  },

  withTheme(theme):: self.withGrafanaIniConfig({
    sections+: {
      users+: {
        default_theme: theme,
      },
    },
  }),

  withAnonymous():: self.withGrafanaIniConfig({
    sections+: {
      'auth.anonymous': {
        enabled: true,
        org_role: 'Admin',
      },
    },
  }),
}
