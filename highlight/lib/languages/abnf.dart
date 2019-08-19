import 'common.dart';
import '../highlight.dart';

var abnf = Mode(
    refs: {},
    illegal: "[!@#\$^&',?+\\x7e`|:]",
    keywords:
        "ALPHA BIT CHAR CR CRLF CTL DIGIT DQUOTE HEXDIG HTAB LF LWSP OCTET SP VCHAR WSP",
    contains: [
      Mode(
          begin: "^[a-zA-Z][a-zA-Z0-9-]*\\s*=",
          returnBegin: true,
          end: "=",
          relevance: 0,
          contains: [
            Mode(className: "attribute", begin: "^[a-zA-Z][a-zA-Z0-9-]*")
          ]),
      Mode(className: "comment", begin: ";", end: "\$", contains: [
        PHRASAL_WORDS_MODE,
        Mode(
            className: "doctag",
            begin: "(?:TODO|FIXME|NOTE|BUG|XXX):",
            relevance: 0)
      ]),
      Mode(className: "symbol", begin: "%b[0-1]+(-[0-1]+|(\\.[0-1]+)+){0,1}"),
      Mode(className: "symbol", begin: "%d[0-9]+(-[0-9]+|(\\.[0-9]+)+){0,1}"),
      Mode(
          className: "symbol",
          begin: "%x[0-9A-F]+(-[0-9A-F]+|(\\.[0-9A-F]+)+){0,1}"),
      Mode(className: "symbol", begin: "%[si]"),
      QUOTE_STRING_MODE,
      NUMBER_MODE
    ]);
