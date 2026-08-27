# log-backend-vom

[vom](https://github.com/orthecreedence/vom) backend for [`log-protocol`](https://github.com/egao1980/log-protocol). Not the protocol — product backends stay in their own repos.

```lisp
(asdf:load-system "log-backend-vom")
(log-backend-vom:use-vom-backend)
(stack-log:configure :level :debug :layout :text)
(stack-log:debug "probe")
```

Default backend: [`log-backend-log4cl`](https://github.com/egao1980/log-backend-log4cl). In-protocol writer: `stream-log-backend`.

Part of [cl-stack](https://github.com/egao1980/cl-stack). Cookbook: [logging.md](https://github.com/egao1980/cl-stack/blob/main/docs/cookbooks/logging.md).

## License

MIT — see [LICENSE](LICENSE).
