load("@bazel_gazelle//:deps.bzl", "go_repository")

def go_deps():
    # NOTE: We ensure that we pin to these specific dependencies by calling
    # this function FIRST, before calls to pull in dependencies for
    # third-party libraries (e.g. rules_go, gazelle, etc.)
    go_repository(
        name = "cc_mvdan_gofumpt",
        build_file_proto_mode = "disable_global",
        importpath = "mvdan.cc/gofumpt",
        sha256 = "66d5c9612657a62b37cfc72efde3330921a9908becc616be5e12739c1ff3965a",
        strip_prefix = "mvdan.cc/gofumpt@v0.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/mvdan.cc/gofumpt/cc_mvdan_gofumpt-v0.8.0.zip",
            "http://ats.apps.svc/gomod/mvdan.cc/gofumpt/cc_mvdan_gofumpt-v0.8.0.zip",
            "https://cache.hawkingrei.com/gomod/mvdan.cc/gofumpt/cc_mvdan_gofumpt-v0.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/mvdan.cc/gofumpt/cc_mvdan_gofumpt-v0.8.0.zip",
        ],
    )
    go_repository(
        name = "cc_mvdan_unparam",
        build_file_proto_mode = "disable_global",
        importpath = "mvdan.cc/unparam",
        sha256 = "1b2900dce01f7b7739914385bed6a888daa9216b7ee5fa2c88f235c29d53d3ed",
        strip_prefix = "mvdan.cc/unparam@v0.0.0-20250301125049-0df0534333a4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/mvdan.cc/unparam/cc_mvdan_unparam-v0.0.0-20250301125049-0df0534333a4.zip",
            "http://ats.apps.svc/gomod/mvdan.cc/unparam/cc_mvdan_unparam-v0.0.0-20250301125049-0df0534333a4.zip",
            "https://cache.hawkingrei.com/gomod/mvdan.cc/unparam/cc_mvdan_unparam-v0.0.0-20250301125049-0df0534333a4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/mvdan.cc/unparam/cc_mvdan_unparam-v0.0.0-20250301125049-0df0534333a4.zip",
        ],
    )
    go_repository(
        name = "co_honnef_go_tools",
        build_file_proto_mode = "disable_global",
        importpath = "honnef.co/go/tools",
        sha256 = "c8fed1950db52dc2e2682be963d564657a1d151898cedbd0f4b822828a899dc5",
        strip_prefix = "honnef.co/go/tools@v0.6.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/honnef.co/go/tools/co_honnef_go_tools-v0.6.1.zip",
            "http://ats.apps.svc/gomod/honnef.co/go/tools/co_honnef_go_tools-v0.6.1.zip",
            "https://cache.hawkingrei.com/gomod/honnef.co/go/tools/co_honnef_go_tools-v0.6.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/honnef.co/go/tools/co_honnef_go_tools-v0.6.1.zip",
        ],
    )
    go_repository(
        name = "com_4d63_gocheckcompilerdirectives",
        build_file_proto_mode = "disable_global",
        importpath = "4d63.com/gocheckcompilerdirectives",
        sha256 = "53f25544be1bba4c2f657af8a2b8245dbbe77be2aa60e386e99b0e1bc836c565",
        strip_prefix = "4d63.com/gocheckcompilerdirectives@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/4d63.com/gocheckcompilerdirectives/com_4d63_gocheckcompilerdirectives-v1.3.0.zip",
            "http://ats.apps.svc/gomod/4d63.com/gocheckcompilerdirectives/com_4d63_gocheckcompilerdirectives-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/4d63.com/gocheckcompilerdirectives/com_4d63_gocheckcompilerdirectives-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/4d63.com/gocheckcompilerdirectives/com_4d63_gocheckcompilerdirectives-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_4d63_gochecknoglobals",
        build_file_proto_mode = "disable_global",
        importpath = "4d63.com/gochecknoglobals",
        sha256 = "bd06de278228ed13b253d2e511519076edc3c115505d028c6c5677ee81079566",
        strip_prefix = "4d63.com/gochecknoglobals@v0.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/4d63.com/gochecknoglobals/com_4d63_gochecknoglobals-v0.2.2.zip",
            "http://ats.apps.svc/gomod/4d63.com/gochecknoglobals/com_4d63_gochecknoglobals-v0.2.2.zip",
            "https://cache.hawkingrei.com/gomod/4d63.com/gochecknoglobals/com_4d63_gochecknoglobals-v0.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/4d63.com/gochecknoglobals/com_4d63_gochecknoglobals-v0.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_4meepo_tagalign",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/4meepo/tagalign",
        sha256 = "80c13c8453e860319019251a148808f1580a5c21a909978ea9251ac51aac098f",
        strip_prefix = "github.com/4meepo/tagalign@v1.4.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/4meepo/tagalign/com_github_4meepo_tagalign-v1.4.2.zip",
            "http://ats.apps.svc/gomod/github.com/4meepo/tagalign/com_github_4meepo_tagalign-v1.4.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/4meepo/tagalign/com_github_4meepo_tagalign-v1.4.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/4meepo/tagalign/com_github_4meepo_tagalign-v1.4.2.zip",
        ],
    )
    go_repository(
        name = "com_github_abirdcfly_dupword",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Abirdcfly/dupword",
        sha256 = "dd2eaba04b0629ebc4403a0395de923b80ac7715d3146f52ec929b748766ee70",
        strip_prefix = "github.com/Abirdcfly/dupword@v0.1.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Abirdcfly/dupword/com_github_abirdcfly_dupword-v0.1.6.zip",
            "http://ats.apps.svc/gomod/github.com/Abirdcfly/dupword/com_github_abirdcfly_dupword-v0.1.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Abirdcfly/dupword/com_github_abirdcfly_dupword-v0.1.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Abirdcfly/dupword/com_github_abirdcfly_dupword-v0.1.6.zip",
        ],
    )
    go_repository(
        name = "com_github_acarl005_stripansi",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/acarl005/stripansi",
        sha256 = "5169858a54f6f06f3089c45db233290fbaf1ebc2c9776649705b6cd9dc58a40c",
        strip_prefix = "github.com/acarl005/stripansi@v0.0.0-20180116102854-5a71ef0e047d",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/acarl005/stripansi/com_github_acarl005_stripansi-v0.0.0-20180116102854-5a71ef0e047d.zip",
            "http://ats.apps.svc/gomod/github.com/acarl005/stripansi/com_github_acarl005_stripansi-v0.0.0-20180116102854-5a71ef0e047d.zip",
            "https://cache.hawkingrei.com/gomod/github.com/acarl005/stripansi/com_github_acarl005_stripansi-v0.0.0-20180116102854-5a71ef0e047d.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/acarl005/stripansi/com_github_acarl005_stripansi-v0.0.0-20180116102854-5a71ef0e047d.zip",
        ],
    )
    go_repository(
        name = "com_github_aclements_go_moremath",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/aclements/go-moremath",
        sha256 = "d83b2a13bee30e772c4f414ccb02c8fec9a4d614e814e1a2c740a6567974861d",
        strip_prefix = "github.com/aclements/go-moremath@v0.0.0-20210112150236-f10218a38794",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/aclements/go-moremath/com_github_aclements_go_moremath-v0.0.0-20210112150236-f10218a38794.zip",
            "http://ats.apps.svc/gomod/github.com/aclements/go-moremath/com_github_aclements_go_moremath-v0.0.0-20210112150236-f10218a38794.zip",
            "https://cache.hawkingrei.com/gomod/github.com/aclements/go-moremath/com_github_aclements_go_moremath-v0.0.0-20210112150236-f10218a38794.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/aclements/go-moremath/com_github_aclements_go_moremath-v0.0.0-20210112150236-f10218a38794.zip",
        ],
    )
    go_repository(
        name = "com_github_ajstarks_deck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ajstarks/deck",
        sha256 = "68bad2e38bf5b01e6bbd7b9bbdba35da94dac72bc4ba41f8ea5fe92aa836a3c3",
        strip_prefix = "github.com/ajstarks/deck@v0.0.0-20200831202436-30c9fc6549a9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ajstarks/deck/com_github_ajstarks_deck-v0.0.0-20200831202436-30c9fc6549a9.zip",
            "http://ats.apps.svc/gomod/github.com/ajstarks/deck/com_github_ajstarks_deck-v0.0.0-20200831202436-30c9fc6549a9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ajstarks/deck/com_github_ajstarks_deck-v0.0.0-20200831202436-30c9fc6549a9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ajstarks/deck/com_github_ajstarks_deck-v0.0.0-20200831202436-30c9fc6549a9.zip",
        ],
    )
    go_repository(
        name = "com_github_ajstarks_deck_generate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ajstarks/deck/generate",
        sha256 = "dce1cbc4cb42ac26512dd0bccf997baeea99fb4595cd419a28e8566d2d7c7ba8",
        strip_prefix = "github.com/ajstarks/deck/generate@v0.0.0-20210309230005-c3f852c02e19",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ajstarks/deck/generate/com_github_ajstarks_deck_generate-v0.0.0-20210309230005-c3f852c02e19.zip",
            "http://ats.apps.svc/gomod/github.com/ajstarks/deck/generate/com_github_ajstarks_deck_generate-v0.0.0-20210309230005-c3f852c02e19.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ajstarks/deck/generate/com_github_ajstarks_deck_generate-v0.0.0-20210309230005-c3f852c02e19.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ajstarks/deck/generate/com_github_ajstarks_deck_generate-v0.0.0-20210309230005-c3f852c02e19.zip",
        ],
    )
    go_repository(
        name = "com_github_ajstarks_svgo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ajstarks/svgo",
        sha256 = "e25b5dbb6cc86d2a0b5db08aad757c534681c2cecb30d84746e09c661cbd7c6f",
        strip_prefix = "github.com/ajstarks/svgo@v0.0.0-20211024235047-1546f124cd8b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ajstarks/svgo/com_github_ajstarks_svgo-v0.0.0-20211024235047-1546f124cd8b.zip",
            "http://ats.apps.svc/gomod/github.com/ajstarks/svgo/com_github_ajstarks_svgo-v0.0.0-20211024235047-1546f124cd8b.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ajstarks/svgo/com_github_ajstarks_svgo-v0.0.0-20211024235047-1546f124cd8b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ajstarks/svgo/com_github_ajstarks_svgo-v0.0.0-20211024235047-1546f124cd8b.zip",
        ],
    )
    go_repository(
        name = "com_github_alecthomas_chroma_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alecthomas/chroma/v2",
        sha256 = "fc03b21c36ac2630e30647afcf2221b15e369104548255e5f3f5dcf50935bdf2",
        strip_prefix = "github.com/alecthomas/chroma/v2@v2.19.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alecthomas/chroma/v2/com_github_alecthomas_chroma_v2-v2.19.0.zip",
            "http://ats.apps.svc/gomod/github.com/alecthomas/chroma/v2/com_github_alecthomas_chroma_v2-v2.19.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alecthomas/chroma/v2/com_github_alecthomas_chroma_v2-v2.19.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alecthomas/chroma/v2/com_github_alecthomas_chroma_v2-v2.19.0.zip",
        ],
    )
    go_repository(
        name = "com_github_alecthomas_go_check_sumtype",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alecthomas/go-check-sumtype",
        sha256 = "7448f726e78a011fa5b711645dd859ea13a91078b7791c02de0ab14e341a25b7",
        strip_prefix = "github.com/alecthomas/go-check-sumtype@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alecthomas/go-check-sumtype/com_github_alecthomas_go_check_sumtype-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/alecthomas/go-check-sumtype/com_github_alecthomas_go_check_sumtype-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alecthomas/go-check-sumtype/com_github_alecthomas_go_check_sumtype-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alecthomas/go-check-sumtype/com_github_alecthomas_go_check_sumtype-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_alecthomas_kingpin_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alecthomas/kingpin/v2",
        sha256 = "ef1ea6fead21e5fcc9e1532187888c8c7c4f3ebbdb00587ab67a19245206ca66",
        strip_prefix = "github.com/alecthomas/kingpin/v2@v2.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alecthomas/kingpin/v2/com_github_alecthomas_kingpin_v2-v2.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/alecthomas/kingpin/v2/com_github_alecthomas_kingpin_v2-v2.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alecthomas/kingpin/v2/com_github_alecthomas_kingpin_v2-v2.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alecthomas/kingpin/v2/com_github_alecthomas_kingpin_v2-v2.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_alecthomas_units",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alecthomas/units",
        sha256 = "0aa254cfcd2f946563e0e9f7875edad87366b595fbe973eb6c01e9da99b35d68",
        strip_prefix = "github.com/alecthomas/units@v0.0.0-20231202071711-9a357b53e9c9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alecthomas/units/com_github_alecthomas_units-v0.0.0-20231202071711-9a357b53e9c9.zip",
            "http://ats.apps.svc/gomod/github.com/alecthomas/units/com_github_alecthomas_units-v0.0.0-20231202071711-9a357b53e9c9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alecthomas/units/com_github_alecthomas_units-v0.0.0-20231202071711-9a357b53e9c9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alecthomas/units/com_github_alecthomas_units-v0.0.0-20231202071711-9a357b53e9c9.zip",
        ],
    )
    go_repository(
        name = "com_github_alexbrainman_sspi",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alexbrainman/sspi",
        sha256 = "f094ecfc4554a9ca70f0ade41747123f3161a15fb1a6112305b99731befc8648",
        strip_prefix = "github.com/alexbrainman/sspi@v0.0.0-20210105120005-909beea2cc74",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alexbrainman/sspi/com_github_alexbrainman_sspi-v0.0.0-20210105120005-909beea2cc74.zip",
            "http://ats.apps.svc/gomod/github.com/alexbrainman/sspi/com_github_alexbrainman_sspi-v0.0.0-20210105120005-909beea2cc74.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alexbrainman/sspi/com_github_alexbrainman_sspi-v0.0.0-20210105120005-909beea2cc74.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alexbrainman/sspi/com_github_alexbrainman_sspi-v0.0.0-20210105120005-909beea2cc74.zip",
        ],
    )
    go_repository(
        name = "com_github_alexkohler_nakedret_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alexkohler/nakedret/v2",
        sha256 = "dee86ae3758ee87d4cb7099cba0f6e1013f370c9eea412fe664832752e9d9aba",
        strip_prefix = "github.com/alexkohler/nakedret/v2@v2.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alexkohler/nakedret/v2/com_github_alexkohler_nakedret_v2-v2.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/alexkohler/nakedret/v2/com_github_alexkohler_nakedret_v2-v2.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alexkohler/nakedret/v2/com_github_alexkohler_nakedret_v2-v2.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alexkohler/nakedret/v2/com_github_alexkohler_nakedret_v2-v2.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_alexkohler_prealloc",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alexkohler/prealloc",
        sha256 = "3da3c6aebc2917ecd1322724060b6aa02f0fa83eb546e07809b94e1d687aeece",
        strip_prefix = "github.com/alexkohler/prealloc@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alexkohler/prealloc/com_github_alexkohler_prealloc-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/alexkohler/prealloc/com_github_alexkohler_prealloc-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alexkohler/prealloc/com_github_alexkohler_prealloc-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alexkohler/prealloc/com_github_alexkohler_prealloc-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_alingse_asasalint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alingse/asasalint",
        sha256 = "e808d5f9e1410fbb686189d9a074d0fe67763b0ff0829c7627f477f71c59783c",
        strip_prefix = "github.com/alingse/asasalint@v0.0.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alingse/asasalint/com_github_alingse_asasalint-v0.0.11.zip",
            "http://ats.apps.svc/gomod/github.com/alingse/asasalint/com_github_alingse_asasalint-v0.0.11.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alingse/asasalint/com_github_alingse_asasalint-v0.0.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alingse/asasalint/com_github_alingse_asasalint-v0.0.11.zip",
        ],
    )
    go_repository(
        name = "com_github_alingse_nilnesserr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/alingse/nilnesserr",
        sha256 = "35b91ca0c88df6713370ab371d2c3eb8b0d56fdda340a108a3edf110f3b1b99a",
        strip_prefix = "github.com/alingse/nilnesserr@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/alingse/nilnesserr/com_github_alingse_nilnesserr-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/alingse/nilnesserr/com_github_alingse_nilnesserr-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/alingse/nilnesserr/com_github_alingse_nilnesserr-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/alingse/nilnesserr/com_github_alingse_nilnesserr-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_aliyun_alibaba_cloud_sdk_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/aliyun/alibaba-cloud-sdk-go",
        sha256 = "21a5b01952452ecd963ba9f2c96ed4a5281341b1ee7b52b32e2562f9397e6961",
        strip_prefix = "github.com/aliyun/alibaba-cloud-sdk-go@v1.61.1581",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/aliyun/alibaba-cloud-sdk-go/com_github_aliyun_alibaba_cloud_sdk_go-v1.61.1581.zip",
            "http://ats.apps.svc/gomod/github.com/aliyun/alibaba-cloud-sdk-go/com_github_aliyun_alibaba_cloud_sdk_go-v1.61.1581.zip",
            "https://cache.hawkingrei.com/gomod/github.com/aliyun/alibaba-cloud-sdk-go/com_github_aliyun_alibaba_cloud_sdk_go-v1.61.1581.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/aliyun/alibaba-cloud-sdk-go/com_github_aliyun_alibaba_cloud_sdk_go-v1.61.1581.zip",
        ],
    )
    go_repository(
        name = "com_github_alwxsin_noinlineerr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/AlwxSin/noinlineerr",
        sha256 = "3c26c03d43d77a0f3539eb422527c677291e8b7829f14e63f38d3a760a287425",
        strip_prefix = "github.com/AlwxSin/noinlineerr@v1.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/AlwxSin/noinlineerr/com_github_alwxsin_noinlineerr-v1.0.5.zip",
            "http://ats.apps.svc/gomod/github.com/AlwxSin/noinlineerr/com_github_alwxsin_noinlineerr-v1.0.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/AlwxSin/noinlineerr/com_github_alwxsin_noinlineerr-v1.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/AlwxSin/noinlineerr/com_github_alwxsin_noinlineerr-v1.0.5.zip",
        ],
    )
    go_repository(
        name = "com_github_andybalholm_brotli",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/andybalholm/brotli",
        sha256 = "f5ae9b2f3260a22ff3f3445fff081d3ef12ee1aa3c0b87eadc59b5a8fb2cdef0",
        strip_prefix = "github.com/andybalholm/brotli@v1.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/andybalholm/brotli/com_github_andybalholm_brotli-v1.0.5.zip",
            "http://ats.apps.svc/gomod/github.com/andybalholm/brotli/com_github_andybalholm_brotli-v1.0.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/andybalholm/brotli/com_github_andybalholm_brotli-v1.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/andybalholm/brotli/com_github_andybalholm_brotli-v1.0.5.zip",
        ],
    )
    go_repository(
        name = "com_github_antihax_optional",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/antihax/optional",
        sha256 = "15ab4d41bdbb72ee0ac63db616cdefc7671c79e13d0f73b58355a6a88219c97f",
        strip_prefix = "github.com/antihax/optional@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/antihax/optional/com_github_antihax_optional-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/antihax/optional/com_github_antihax_optional-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/antihax/optional/com_github_antihax_optional-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/antihax/optional/com_github_antihax_optional-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_antonboom_errname",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Antonboom/errname",
        sha256 = "38ad2d6ae68fe530174b56880db392247af1e2108fbbe3d5e7876382582930a1",
        strip_prefix = "github.com/Antonboom/errname@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Antonboom/errname/com_github_antonboom_errname-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/Antonboom/errname/com_github_antonboom_errname-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Antonboom/errname/com_github_antonboom_errname-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Antonboom/errname/com_github_antonboom_errname-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_antonboom_nilnil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Antonboom/nilnil",
        sha256 = "071cf56a8d47eb706c20ee62e645ce2603679436ec87d5e633c4f61534bdb058",
        strip_prefix = "github.com/Antonboom/nilnil@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Antonboom/nilnil/com_github_antonboom_nilnil-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/Antonboom/nilnil/com_github_antonboom_nilnil-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Antonboom/nilnil/com_github_antonboom_nilnil-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Antonboom/nilnil/com_github_antonboom_nilnil-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_antonboom_testifylint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Antonboom/testifylint",
        sha256 = "db7baf7c16c67826e44c26c74eb4abed7b288c17f41de32ca993f03a61689d97",
        strip_prefix = "github.com/Antonboom/testifylint@v1.6.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Antonboom/testifylint/com_github_antonboom_testifylint-v1.6.1.zip",
            "http://ats.apps.svc/gomod/github.com/Antonboom/testifylint/com_github_antonboom_testifylint-v1.6.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Antonboom/testifylint/com_github_antonboom_testifylint-v1.6.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Antonboom/testifylint/com_github_antonboom_testifylint-v1.6.1.zip",
        ],
    )
    go_repository(
        name = "com_github_apache_arrow_go_v12",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/apache/arrow/go/v12",
        sha256 = "5eb05ed9c2c5e164503b00912b7b2456400578de29e7e8a8956a41acd861ab5b",
        strip_prefix = "github.com/apache/arrow/go/v12@v12.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/apache/arrow/go/v12/com_github_apache_arrow_go_v12-v12.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/apache/arrow/go/v12/com_github_apache_arrow_go_v12-v12.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/apache/arrow/go/v12/com_github_apache_arrow_go_v12-v12.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/apache/arrow/go/v12/com_github_apache_arrow_go_v12-v12.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_apache_skywalking_eyes",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/apache/skywalking-eyes",
        sha256 = "4fb4df2319ec798ec72d31a13e90c51e3fa4405cb69e5e4b701bb55dbfd4a360",
        strip_prefix = "github.com/apache/skywalking-eyes@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/apache/skywalking-eyes/com_github_apache_skywalking_eyes-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/apache/skywalking-eyes/com_github_apache_skywalking_eyes-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/apache/skywalking-eyes/com_github_apache_skywalking_eyes-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/apache/skywalking-eyes/com_github_apache_skywalking_eyes-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_apache_thrift",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/apache/thrift",
        sha256 = "50d5c610df30fa2a6039394d5142382b7d9938870dfb12ef46bddfa3da250893",
        strip_prefix = "github.com/apache/thrift@v0.16.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/apache/thrift/com_github_apache_thrift-v0.16.0.zip",
            "http://ats.apps.svc/gomod/github.com/apache/thrift/com_github_apache_thrift-v0.16.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/apache/thrift/com_github_apache_thrift-v0.16.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/apache/thrift/com_github_apache_thrift-v0.16.0.zip",
        ],
    )
    go_repository(
        name = "com_github_armon_consul_api",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/armon/consul-api",
        sha256 = "091b79667f16ae245785956c490fe05ee26970a89f8ecdbe858ae3510d725088",
        strip_prefix = "github.com/armon/consul-api@v0.0.0-20180202201655-eb2c6b5be1b6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/armon/consul-api/com_github_armon_consul_api-v0.0.0-20180202201655-eb2c6b5be1b6.zip",
            "http://ats.apps.svc/gomod/github.com/armon/consul-api/com_github_armon_consul_api-v0.0.0-20180202201655-eb2c6b5be1b6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/armon/consul-api/com_github_armon_consul_api-v0.0.0-20180202201655-eb2c6b5be1b6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/armon/consul-api/com_github_armon_consul_api-v0.0.0-20180202201655-eb2c6b5be1b6.zip",
        ],
    )
    go_repository(
        name = "com_github_armon_go_metrics",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/armon/go-metrics",
        sha256 = "f1b9155b8635eea48fb8929934b1268bf624cec2d51fcef8b62fa4aa91e05cc9",
        strip_prefix = "github.com/armon/go-metrics@v0.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/armon/go-metrics/com_github_armon_go_metrics-v0.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/armon/go-metrics/com_github_armon_go_metrics-v0.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/armon/go-metrics/com_github_armon_go_metrics-v0.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/armon/go-metrics/com_github_armon_go_metrics-v0.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_armon_go_socks5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/armon/go-socks5",
        sha256 = "f473e6dce826a0552639833cf72cfaa8bc7141daa7b537622d7f78eacfd9dfb3",
        strip_prefix = "github.com/armon/go-socks5@v0.0.0-20160902184237-e75332964ef5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/armon/go-socks5/com_github_armon_go_socks5-v0.0.0-20160902184237-e75332964ef5.zip",
            "http://ats.apps.svc/gomod/github.com/armon/go-socks5/com_github_armon_go_socks5-v0.0.0-20160902184237-e75332964ef5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/armon/go-socks5/com_github_armon_go_socks5-v0.0.0-20160902184237-e75332964ef5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/armon/go-socks5/com_github_armon_go_socks5-v0.0.0-20160902184237-e75332964ef5.zip",
        ],
    )
    go_repository(
        name = "com_github_asaskevich_govalidator",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/asaskevich/govalidator",
        sha256 = "0f8ec67bbc585d29ec115c0885cef6f2431a422cc1cc10008e466ebe8be5dc37",
        strip_prefix = "github.com/asaskevich/govalidator@v0.0.0-20230301143203-a9d515a09cc2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/asaskevich/govalidator/com_github_asaskevich_govalidator-v0.0.0-20230301143203-a9d515a09cc2.zip",
            "http://ats.apps.svc/gomod/github.com/asaskevich/govalidator/com_github_asaskevich_govalidator-v0.0.0-20230301143203-a9d515a09cc2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/asaskevich/govalidator/com_github_asaskevich_govalidator-v0.0.0-20230301143203-a9d515a09cc2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/asaskevich/govalidator/com_github_asaskevich_govalidator-v0.0.0-20230301143203-a9d515a09cc2.zip",
        ],
    )
    go_repository(
        name = "com_github_ashanbrown_forbidigo_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ashanbrown/forbidigo/v2",
        sha256 = "b9194909dbf881c5b66a7ac2e3a1859121feeb76ce766c7d50df95720995b8e1",
        strip_prefix = "github.com/ashanbrown/forbidigo/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ashanbrown/forbidigo/v2/com_github_ashanbrown_forbidigo_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/ashanbrown/forbidigo/v2/com_github_ashanbrown_forbidigo_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ashanbrown/forbidigo/v2/com_github_ashanbrown_forbidigo_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ashanbrown/forbidigo/v2/com_github_ashanbrown_forbidigo_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ashanbrown_makezero",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ashanbrown/makezero",
        sha256 = "442f927083fd8011c9c4857cb165ea359377588a679c82bb3c6a8e44d207fee0",
        strip_prefix = "github.com/ashanbrown/makezero@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ashanbrown/makezero/com_github_ashanbrown_makezero-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/ashanbrown/makezero/com_github_ashanbrown_makezero-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ashanbrown/makezero/com_github_ashanbrown_makezero-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ashanbrown/makezero/com_github_ashanbrown_makezero-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ashanbrown_makezero_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ashanbrown/makezero/v2",
        sha256 = "e13b5575ecece479d17333ff125a4a4169832c4f2d30f9e96a2993dc4e4053ae",
        strip_prefix = "github.com/ashanbrown/makezero/v2@v2.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ashanbrown/makezero/v2/com_github_ashanbrown_makezero_v2-v2.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/ashanbrown/makezero/v2/com_github_ashanbrown_makezero_v2-v2.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ashanbrown/makezero/v2/com_github_ashanbrown_makezero_v2-v2.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ashanbrown/makezero/v2/com_github_ashanbrown_makezero_v2-v2.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_aws_aws_sdk_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/aws/aws-sdk-go",
        sha256 = "5d0522d952824a79d837bba9c0dfe1b024628a99be4f1d031611e18d7e98bbce",
        strip_prefix = "github.com/aws/aws-sdk-go@v1.55.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/aws/aws-sdk-go/com_github_aws_aws_sdk_go-v1.55.5.zip",
            "http://ats.apps.svc/gomod/github.com/aws/aws-sdk-go/com_github_aws_aws_sdk_go-v1.55.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/aws/aws-sdk-go/com_github_aws_aws_sdk_go-v1.55.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/aws/aws-sdk-go/com_github_aws_aws_sdk_go-v1.55.5.zip",
        ],
    )
    go_repository(
        name = "com_github_aymanbagabas_go_osc52_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/aymanbagabas/go-osc52/v2",
        sha256 = "939ebf2a5481f2172e1a5e0c318d05aef5b6d950a960556216c3da7879a927f8",
        strip_prefix = "github.com/aymanbagabas/go-osc52/v2@v2.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/aymanbagabas/go-osc52/v2/com_github_aymanbagabas_go_osc52_v2-v2.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/aymanbagabas/go-osc52/v2/com_github_aymanbagabas_go_osc52_v2-v2.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/aymanbagabas/go-osc52/v2/com_github_aymanbagabas_go_osc52_v2-v2.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/aymanbagabas/go-osc52/v2/com_github_aymanbagabas_go_osc52_v2-v2.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_aymerick_douceur",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/aymerick/douceur",
        sha256 = "dcbf69760cc1a8b32384495438e1086e4c3d669b2ebc0debd92e1865ffd6be60",
        strip_prefix = "github.com/aymerick/douceur@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/aymerick/douceur/com_github_aymerick_douceur-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/aymerick/douceur/com_github_aymerick_douceur-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/aymerick/douceur/com_github_aymerick_douceur-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/aymerick/douceur/com_github_aymerick_douceur-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_azcore",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/azcore",
        sha256 = "bf0fca85626fc28c5b3b3c06339a42d2cd78637a1401d3db9a83674ced9aa0cb",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/azcore@v1.14.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/azcore/com_github_azure_azure_sdk_for_go_sdk_azcore-v1.14.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/azcore/com_github_azure_azure_sdk_for_go_sdk_azcore-v1.14.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/azcore/com_github_azure_azure_sdk_for_go_sdk_azcore-v1.14.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/azcore/com_github_azure_azure_sdk_for_go_sdk_azcore-v1.14.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_azidentity",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/azidentity",
        sha256 = "11b5939e70cf765a9753155023dd3e3ea42cc40a133307336abc0f8a4e3af404",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/azidentity@v1.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/azidentity/com_github_azure_azure_sdk_for_go_sdk_azidentity-v1.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/azidentity/com_github_azure_azure_sdk_for_go_sdk_azidentity-v1.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/azidentity/com_github_azure_azure_sdk_for_go_sdk_azidentity-v1.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/azidentity/com_github_azure_azure_sdk_for_go_sdk_azidentity-v1.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_internal",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/internal",
        sha256 = "0a9b4fe658e348b9a6535b1ae0698fa5cf5ba9ba3710530edbdc763eeffe2d24",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/internal@v1.10.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/internal/com_github_azure_azure_sdk_for_go_sdk_internal-v1.10.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/internal/com_github_azure_azure_sdk_for_go_sdk_internal-v1.10.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/internal/com_github_azure_azure_sdk_for_go_sdk_internal-v1.10.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/internal/com_github_azure_azure_sdk_for_go_sdk_internal-v1.10.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_resourcemanager_compute_armcompute_v5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5",
        sha256 = "f47869d09394fbe965b013f539bf7c1c65af9833dbfea0c12f7b6a081870b6f6",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5@v5.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_compute_armcompute_v5-v5.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_compute_armcompute_v5-v5.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_compute_armcompute_v5-v5.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/compute/armcompute/v5/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_compute_armcompute_v5-v5.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_resourcemanager_network_armnetwork_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4",
        sha256 = "e002f35fb0d7200d8cd31bc6b1e91e56400ddc3f50887e8795285268ac5bdaff",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4@v4.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_network_armnetwork_v4-v4.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_network_armnetwork_v4-v4.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_network_armnetwork_v4-v4.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/network/armnetwork/v4/com_github_azure_azure_sdk_for_go_sdk_resourcemanager_network_armnetwork_v4-v4.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_azure_sdk_for_go_sdk_storage_azblob",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/azure-sdk-for-go/sdk/storage/azblob",
        sha256 = "9bb69aea32f1d59711701f9562d66432c9c0374205e5009d1d1a62f03fb4fdad",
        strip_prefix = "github.com/Azure/azure-sdk-for-go/sdk/storage/azblob@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/com_github_azure_azure_sdk_for_go_sdk_storage_azblob-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/com_github_azure_azure_sdk_for_go_sdk_storage_azblob-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/com_github_azure_azure_sdk_for_go_sdk_storage_azblob-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/com_github_azure_azure_sdk_for_go_sdk_storage_azblob-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_azure_go_ntlmssp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Azure/go-ntlmssp",
        sha256 = "cc6d4e9caf938a71c9217f3aa8bdbb1c072faff3444bb680a2759c947da2085c",
        strip_prefix = "github.com/Azure/go-ntlmssp@v0.0.0-20221128193559-754e69321358",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Azure/go-ntlmssp/com_github_azure_go_ntlmssp-v0.0.0-20221128193559-754e69321358.zip",
            "http://ats.apps.svc/gomod/github.com/Azure/go-ntlmssp/com_github_azure_go_ntlmssp-v0.0.0-20221128193559-754e69321358.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Azure/go-ntlmssp/com_github_azure_go_ntlmssp-v0.0.0-20221128193559-754e69321358.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Azure/go-ntlmssp/com_github_azure_go_ntlmssp-v0.0.0-20221128193559-754e69321358.zip",
        ],
    )
    go_repository(
        name = "com_github_azuread_microsoft_authentication_library_for_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/AzureAD/microsoft-authentication-library-for-go",
        sha256 = "895ac3948492180ed21eabe651bebe45c9d99b92c2738206759d6faf4f430d26",
        strip_prefix = "github.com/AzureAD/microsoft-authentication-library-for-go@v1.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/AzureAD/microsoft-authentication-library-for-go/com_github_azuread_microsoft_authentication_library_for_go-v1.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/AzureAD/microsoft-authentication-library-for-go/com_github_azuread_microsoft_authentication_library_for_go-v1.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/AzureAD/microsoft-authentication-library-for-go/com_github_azuread_microsoft_authentication_library_for_go-v1.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/AzureAD/microsoft-authentication-library-for-go/com_github_azuread_microsoft_authentication_library_for_go-v1.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_bazelbuild_buildtools",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bazelbuild/buildtools",
        sha256 = "5ec0befc70edf16728838d94b240dfd01ba576f8a3901de84c0861c0ce2b8db6",
        strip_prefix = "github.com/bazelbuild/buildtools@v0.0.0-20230926111657-7d855c59baeb",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bazelbuild/buildtools/com_github_bazelbuild_buildtools-v0.0.0-20230926111657-7d855c59baeb.zip",
            "http://ats.apps.svc/gomod/github.com/bazelbuild/buildtools/com_github_bazelbuild_buildtools-v0.0.0-20230926111657-7d855c59baeb.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bazelbuild/buildtools/com_github_bazelbuild_buildtools-v0.0.0-20230926111657-7d855c59baeb.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bazelbuild/buildtools/com_github_bazelbuild_buildtools-v0.0.0-20230926111657-7d855c59baeb.zip",
        ],
    )
    go_repository(
        name = "com_github_bazelbuild_rules_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bazelbuild/rules_go",
        sha256 = "f39abb77746d12e017795acf52262756e1c74fd2105d6ad8164d10a27407f2c0",
        strip_prefix = "github.com/bazelbuild/rules_go@v0.42.1-0.20231101215950-df20c987afcb",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bazelbuild/rules_go/com_github_bazelbuild_rules_go-v0.42.1-0.20231101215950-df20c987afcb.zip",
            "http://ats.apps.svc/gomod/github.com/bazelbuild/rules_go/com_github_bazelbuild_rules_go-v0.42.1-0.20231101215950-df20c987afcb.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bazelbuild/rules_go/com_github_bazelbuild_rules_go-v0.42.1-0.20231101215950-df20c987afcb.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bazelbuild/rules_go/com_github_bazelbuild_rules_go-v0.42.1-0.20231101215950-df20c987afcb.zip",
        ],
    )
    go_repository(
        name = "com_github_bboreham_go_loser",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bboreham/go-loser",
        sha256 = "d39c329a916c6e3af23a77ed3615f49726258cf3fa7b126c5ad06e7a5c3cbb4f",
        strip_prefix = "github.com/bboreham/go-loser@v0.0.0-20230920113527-fcc2c21820a3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bboreham/go-loser/com_github_bboreham_go_loser-v0.0.0-20230920113527-fcc2c21820a3.zip",
            "http://ats.apps.svc/gomod/github.com/bboreham/go-loser/com_github_bboreham_go_loser-v0.0.0-20230920113527-fcc2c21820a3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bboreham/go-loser/com_github_bboreham_go_loser-v0.0.0-20230920113527-fcc2c21820a3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bboreham/go-loser/com_github_bboreham_go_loser-v0.0.0-20230920113527-fcc2c21820a3.zip",
        ],
    )
    go_repository(
        name = "com_github_benbjohnson_clock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/benbjohnson/clock",
        sha256 = "b710f0d542532ecb521fcaeda6c09977dced8722b05956fecccc97464d3dcee8",
        strip_prefix = "github.com/benbjohnson/clock@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/benbjohnson/clock/com_github_benbjohnson_clock-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/benbjohnson/clock/com_github_benbjohnson_clock-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/benbjohnson/clock/com_github_benbjohnson_clock-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/benbjohnson/clock/com_github_benbjohnson_clock-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_beorn7_perks",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/beorn7/perks",
        sha256 = "25bd9e2d94aca770e6dbc1f53725f84f6af4432f631d35dd2c46f96ef0512f1a",
        strip_prefix = "github.com/beorn7/perks@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/beorn7/perks/com_github_beorn7_perks-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/beorn7/perks/com_github_beorn7_perks-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/beorn7/perks/com_github_beorn7_perks-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/beorn7/perks/com_github_beorn7_perks-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_bits_and_blooms_bitset",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bits-and-blooms/bitset",
        sha256 = "29542828d3fa62199ac8fe6b69ed5284502b52549e1c64dcdbeeed4eab981a37",
        strip_prefix = "github.com/bits-and-blooms/bitset@v1.14.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bits-and-blooms/bitset/com_github_bits_and_blooms_bitset-v1.14.3.zip",
            "http://ats.apps.svc/gomod/github.com/bits-and-blooms/bitset/com_github_bits_and_blooms_bitset-v1.14.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bits-and-blooms/bitset/com_github_bits_and_blooms_bitset-v1.14.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bits-and-blooms/bitset/com_github_bits_and_blooms_bitset-v1.14.3.zip",
        ],
    )
    go_repository(
        name = "com_github_bkielbasa_cyclop",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bkielbasa/cyclop",
        sha256 = "03d2440ee0559be4d6434cbaee59c9336f37dafe09ba085e1405506f9cd08e1d",
        strip_prefix = "github.com/bkielbasa/cyclop@v1.2.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bkielbasa/cyclop/com_github_bkielbasa_cyclop-v1.2.3.zip",
            "http://ats.apps.svc/gomod/github.com/bkielbasa/cyclop/com_github_bkielbasa_cyclop-v1.2.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bkielbasa/cyclop/com_github_bkielbasa_cyclop-v1.2.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bkielbasa/cyclop/com_github_bkielbasa_cyclop-v1.2.3.zip",
        ],
    )
    go_repository(
        name = "com_github_blacktear23_go_proxyprotocol",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/blacktear23/go-proxyprotocol",
        sha256 = "156ac8095023f9aa7a0bf0706508601443492fc063f0b73dd20e728e912c5bd0",
        strip_prefix = "github.com/blacktear23/go-proxyprotocol@v1.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/blacktear23/go-proxyprotocol/com_github_blacktear23_go_proxyprotocol-v1.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/blacktear23/go-proxyprotocol/com_github_blacktear23_go_proxyprotocol-v1.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/blacktear23/go-proxyprotocol/com_github_blacktear23_go_proxyprotocol-v1.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/blacktear23/go-proxyprotocol/com_github_blacktear23_go_proxyprotocol-v1.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_blizzy78_varnamelen",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/blizzy78/varnamelen",
        sha256 = "2f7dd2db1e40fd541088d2bd3e0e68e430653ad644c6f1656de42d7d01d0b261",
        strip_prefix = "github.com/blizzy78/varnamelen@v0.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/blizzy78/varnamelen/com_github_blizzy78_varnamelen-v0.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/blizzy78/varnamelen/com_github_blizzy78_varnamelen-v0.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/blizzy78/varnamelen/com_github_blizzy78_varnamelen-v0.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/blizzy78/varnamelen/com_github_blizzy78_varnamelen-v0.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_bmatcuk_doublestar_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bmatcuk/doublestar/v2",
        sha256 = "aa78ea07acab3278737ba2b2d31bae185f414afe187f76589178b25db8aa7b8c",
        strip_prefix = "github.com/bmatcuk/doublestar/v2@v2.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bmatcuk/doublestar/v2/com_github_bmatcuk_doublestar_v2-v2.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/bmatcuk/doublestar/v2/com_github_bmatcuk_doublestar_v2-v2.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bmatcuk/doublestar/v2/com_github_bmatcuk_doublestar_v2-v2.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bmatcuk/doublestar/v2/com_github_bmatcuk_doublestar_v2-v2.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_bombsimon_wsl_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bombsimon/wsl/v4",
        sha256 = "51b1783a672f1cfcfe876147675460b6bd3c3ff5a95086ba4ccbf6f02ec25895",
        strip_prefix = "github.com/bombsimon/wsl/v4@v4.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bombsimon/wsl/v4/com_github_bombsimon_wsl_v4-v4.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/bombsimon/wsl/v4/com_github_bombsimon_wsl_v4-v4.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bombsimon/wsl/v4/com_github_bombsimon_wsl_v4-v4.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bombsimon/wsl/v4/com_github_bombsimon_wsl_v4-v4.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_bombsimon_wsl_v5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/bombsimon/wsl/v5",
        sha256 = "258a3b646a5f35ba2357f557d4820c0d8b96497554dcf0c8bdbbcb9785f30b4a",
        strip_prefix = "github.com/bombsimon/wsl/v5@v5.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/bombsimon/wsl/v5/com_github_bombsimon_wsl_v5-v5.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/bombsimon/wsl/v5/com_github_bombsimon_wsl_v5-v5.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/bombsimon/wsl/v5/com_github_bombsimon_wsl_v5-v5.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/bombsimon/wsl/v5/com_github_bombsimon_wsl_v5-v5.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_boombuler_barcode",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/boombuler/barcode",
        sha256 = "812c5beeaa87864227f9d92a9ae71792dc0e6302a33737a91aabe1e511cde42b",
        strip_prefix = "github.com/boombuler/barcode@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/boombuler/barcode/com_github_boombuler_barcode-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/boombuler/barcode/com_github_boombuler_barcode-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/boombuler/barcode/com_github_boombuler_barcode-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/boombuler/barcode/com_github_boombuler_barcode-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_breml_bidichk",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/breml/bidichk",
        sha256 = "7c9e97285e44049be986dba659061971bdb1dacb78daac75213992ff6b4c76c9",
        strip_prefix = "github.com/breml/bidichk@v0.3.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/breml/bidichk/com_github_breml_bidichk-v0.3.3.zip",
            "http://ats.apps.svc/gomod/github.com/breml/bidichk/com_github_breml_bidichk-v0.3.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/breml/bidichk/com_github_breml_bidichk-v0.3.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/breml/bidichk/com_github_breml_bidichk-v0.3.3.zip",
        ],
    )
    go_repository(
        name = "com_github_breml_errchkjson",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/breml/errchkjson",
        sha256 = "f3327c0055ac2943b06ecd303d7dfa7010576a8bb0fc3da39ff68de45fd792f6",
        strip_prefix = "github.com/breml/errchkjson@v0.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/breml/errchkjson/com_github_breml_errchkjson-v0.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/breml/errchkjson/com_github_breml_errchkjson-v0.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/breml/errchkjson/com_github_breml_errchkjson-v0.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/breml/errchkjson/com_github_breml_errchkjson-v0.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_burntsushi_toml",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/BurntSushi/toml",
        sha256 = "a10c8d3d6c4a9b73dc885464245eec6b27d64f430d6979389cd9c58adde15855",
        strip_prefix = "github.com/BurntSushi/toml@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/BurntSushi/toml/com_github_burntsushi_toml-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/BurntSushi/toml/com_github_burntsushi_toml-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/BurntSushi/toml/com_github_burntsushi_toml-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/BurntSushi/toml/com_github_burntsushi_toml-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_burntsushi_xgb",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/BurntSushi/xgb",
        sha256 = "f52962c7fbeca81ea8a777d1f8b1f1d25803dc437fbb490f253344232884328e",
        strip_prefix = "github.com/BurntSushi/xgb@v0.0.0-20160522181843-27f122750802",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/BurntSushi/xgb/com_github_burntsushi_xgb-v0.0.0-20160522181843-27f122750802.zip",
            "http://ats.apps.svc/gomod/github.com/BurntSushi/xgb/com_github_burntsushi_xgb-v0.0.0-20160522181843-27f122750802.zip",
            "https://cache.hawkingrei.com/gomod/github.com/BurntSushi/xgb/com_github_burntsushi_xgb-v0.0.0-20160522181843-27f122750802.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/BurntSushi/xgb/com_github_burntsushi_xgb-v0.0.0-20160522181843-27f122750802.zip",
        ],
    )
    go_repository(
        name = "com_github_butuzov_ireturn",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/butuzov/ireturn",
        sha256 = "3449727d9b14f42cca652f3d0c1f8df4ffc03c0d174bdfc1808d5dffbddfa4df",
        strip_prefix = "github.com/butuzov/ireturn@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/butuzov/ireturn/com_github_butuzov_ireturn-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/butuzov/ireturn/com_github_butuzov_ireturn-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/butuzov/ireturn/com_github_butuzov_ireturn-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/butuzov/ireturn/com_github_butuzov_ireturn-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_butuzov_mirror",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/butuzov/mirror",
        sha256 = "6eafc7a1f1dbf6751986cd5091e63629e8b593a1c649e9791de605c2b643d6d1",
        strip_prefix = "github.com/butuzov/mirror@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/butuzov/mirror/com_github_butuzov_mirror-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/butuzov/mirror/com_github_butuzov_mirror-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/butuzov/mirror/com_github_butuzov_mirror-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/butuzov/mirror/com_github_butuzov_mirror-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_cakturk_go_netstat",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cakturk/go-netstat",
        sha256 = "c8c3a7b894b4522d56bef918d1299b848ea78c566e19d3e35afa7ce0a207b5ab",
        strip_prefix = "github.com/cakturk/go-netstat@v0.0.0-20200220111822-e5b49efee7a5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cakturk/go-netstat/com_github_cakturk_go_netstat-v0.0.0-20200220111822-e5b49efee7a5.zip",
            "http://ats.apps.svc/gomod/github.com/cakturk/go-netstat/com_github_cakturk_go_netstat-v0.0.0-20200220111822-e5b49efee7a5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cakturk/go-netstat/com_github_cakturk_go_netstat-v0.0.0-20200220111822-e5b49efee7a5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cakturk/go-netstat/com_github_cakturk_go_netstat-v0.0.0-20200220111822-e5b49efee7a5.zip",
        ],
    )
    go_repository(
        name = "com_github_carlmjohnson_flagext",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/carlmjohnson/flagext",
        sha256 = "a0ddd38aeb139c1c9c1a4439601782d03cb4eefe2b137d1e908494de43d234b9",
        strip_prefix = "github.com/carlmjohnson/flagext@v0.21.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/carlmjohnson/flagext/com_github_carlmjohnson_flagext-v0.21.0.zip",
            "http://ats.apps.svc/gomod/github.com/carlmjohnson/flagext/com_github_carlmjohnson_flagext-v0.21.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/carlmjohnson/flagext/com_github_carlmjohnson_flagext-v0.21.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/carlmjohnson/flagext/com_github_carlmjohnson_flagext-v0.21.0.zip",
        ],
    )
    go_repository(
        name = "com_github_catenacyber_perfsprint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/catenacyber/perfsprint",
        sha256 = "f6b074c49c43e38e2f4bbc16c6f706bd0d1776acf03202dc0f0121a4e0a54523",
        strip_prefix = "github.com/catenacyber/perfsprint@v0.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/catenacyber/perfsprint/com_github_catenacyber_perfsprint-v0.9.1.zip",
            "http://ats.apps.svc/gomod/github.com/catenacyber/perfsprint/com_github_catenacyber_perfsprint-v0.9.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/catenacyber/perfsprint/com_github_catenacyber_perfsprint-v0.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/catenacyber/perfsprint/com_github_catenacyber_perfsprint-v0.9.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ccojocar_zxcvbn_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ccojocar/zxcvbn-go",
        sha256 = "b069116e1dbf10fd542397d9534f779c4c4801a1d97a51a5570a27eb85cf1ac4",
        strip_prefix = "github.com/ccojocar/zxcvbn-go@v1.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ccojocar/zxcvbn-go/com_github_ccojocar_zxcvbn_go-v1.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/ccojocar/zxcvbn-go/com_github_ccojocar_zxcvbn_go-v1.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ccojocar/zxcvbn-go/com_github_ccojocar_zxcvbn_go-v1.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ccojocar/zxcvbn-go/com_github_ccojocar_zxcvbn_go-v1.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_cenkalti_backoff_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cenkalti/backoff/v4",
        sha256 = "0b1d9cedebb1b814f4fbc03a47fdd2c2bb91d8cf14dbb1a71d3bc1482600cd2a",
        strip_prefix = "github.com/cenkalti/backoff/v4@v4.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cenkalti/backoff/v4/com_github_cenkalti_backoff_v4-v4.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/cenkalti/backoff/v4/com_github_cenkalti_backoff_v4-v4.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cenkalti/backoff/v4/com_github_cenkalti_backoff_v4-v4.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cenkalti/backoff/v4/com_github_cenkalti_backoff_v4-v4.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_census_instrumentation_opencensus_proto",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/census-instrumentation/opencensus-proto",
        sha256 = "6fce66b7dcd2cba031ed9d73d77d6b21c2fe749c5de27cbb416a2d2cc1c68719",
        strip_prefix = "github.com/census-instrumentation/opencensus-proto@v0.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/census-instrumentation/opencensus-proto/com_github_census_instrumentation_opencensus_proto-v0.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/census-instrumentation/opencensus-proto/com_github_census_instrumentation_opencensus_proto-v0.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/census-instrumentation/opencensus-proto/com_github_census_instrumentation_opencensus_proto-v0.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/census-instrumentation/opencensus-proto/com_github_census_instrumentation_opencensus_proto-v0.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_cespare_xxhash_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cespare/xxhash/v2",
        sha256 = "145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3",
        strip_prefix = "github.com/cespare/xxhash/v2@v2.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cespare/xxhash/v2/com_github_cespare_xxhash_v2-v2.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/cespare/xxhash/v2/com_github_cespare_xxhash_v2-v2.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cespare/xxhash/v2/com_github_cespare_xxhash_v2-v2.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cespare/xxhash/v2/com_github_cespare_xxhash_v2-v2.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_charithe_durationcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charithe/durationcheck",
        sha256 = "250aebaee51d0596b00135b96c0920cbe463134494e69346da38da67cd3b0c8f",
        strip_prefix = "github.com/charithe/durationcheck@v0.0.10",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charithe/durationcheck/com_github_charithe_durationcheck-v0.0.10.zip",
            "http://ats.apps.svc/gomod/github.com/charithe/durationcheck/com_github_charithe_durationcheck-v0.0.10.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charithe/durationcheck/com_github_charithe_durationcheck-v0.0.10.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charithe/durationcheck/com_github_charithe_durationcheck-v0.0.10.zip",
        ],
    )
    go_repository(
        name = "com_github_charmbracelet_colorprofile",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charmbracelet/colorprofile",
        sha256 = "8df093c3abeab24f9c17464cf222a4f44e3875acc4cd7a071c8b856934bffc2d",
        strip_prefix = "github.com/charmbracelet/colorprofile@v0.2.3-0.20250311203215-f60798e515dc",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charmbracelet/colorprofile/com_github_charmbracelet_colorprofile-v0.2.3-0.20250311203215-f60798e515dc.zip",
            "http://ats.apps.svc/gomod/github.com/charmbracelet/colorprofile/com_github_charmbracelet_colorprofile-v0.2.3-0.20250311203215-f60798e515dc.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charmbracelet/colorprofile/com_github_charmbracelet_colorprofile-v0.2.3-0.20250311203215-f60798e515dc.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charmbracelet/colorprofile/com_github_charmbracelet_colorprofile-v0.2.3-0.20250311203215-f60798e515dc.zip",
        ],
    )
    go_repository(
        name = "com_github_charmbracelet_lipgloss",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charmbracelet/lipgloss",
        sha256 = "22512fd8c211302255bb6f57d8018eed9b8d8f6dd51310512901240bde9b061a",
        strip_prefix = "github.com/charmbracelet/lipgloss@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charmbracelet/lipgloss/com_github_charmbracelet_lipgloss-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/charmbracelet/lipgloss/com_github_charmbracelet_lipgloss-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charmbracelet/lipgloss/com_github_charmbracelet_lipgloss-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charmbracelet/lipgloss/com_github_charmbracelet_lipgloss-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_charmbracelet_x_ansi",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charmbracelet/x/ansi",
        sha256 = "93232b97a5a80c2c5c283faa63d434f71387afaf255e0dab9479a066581b946d",
        strip_prefix = "github.com/charmbracelet/x/ansi@v0.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charmbracelet/x/ansi/com_github_charmbracelet_x_ansi-v0.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/charmbracelet/x/ansi/com_github_charmbracelet_x_ansi-v0.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charmbracelet/x/ansi/com_github_charmbracelet_x_ansi-v0.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charmbracelet/x/ansi/com_github_charmbracelet_x_ansi-v0.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_charmbracelet_x_cellbuf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charmbracelet/x/cellbuf",
        sha256 = "afb3737da68b726e922e1982d8e2a354fc74ebc9a458879bbc1bbbcd39fda654",
        strip_prefix = "github.com/charmbracelet/x/cellbuf@v0.0.13-0.20250311204145-2c3ea96c31dd",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charmbracelet/x/cellbuf/com_github_charmbracelet_x_cellbuf-v0.0.13-0.20250311204145-2c3ea96c31dd.zip",
            "http://ats.apps.svc/gomod/github.com/charmbracelet/x/cellbuf/com_github_charmbracelet_x_cellbuf-v0.0.13-0.20250311204145-2c3ea96c31dd.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charmbracelet/x/cellbuf/com_github_charmbracelet_x_cellbuf-v0.0.13-0.20250311204145-2c3ea96c31dd.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charmbracelet/x/cellbuf/com_github_charmbracelet_x_cellbuf-v0.0.13-0.20250311204145-2c3ea96c31dd.zip",
        ],
    )
    go_repository(
        name = "com_github_charmbracelet_x_term",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/charmbracelet/x/term",
        sha256 = "943ea615acab846478d15fc9b21eb5e47df786577915f84565b6d4b31d4014a0",
        strip_prefix = "github.com/charmbracelet/x/term@v0.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/charmbracelet/x/term/com_github_charmbracelet_x_term-v0.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/charmbracelet/x/term/com_github_charmbracelet_x_term-v0.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/charmbracelet/x/term/com_github_charmbracelet_x_term-v0.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/charmbracelet/x/term/com_github_charmbracelet_x_term-v0.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_cheggaaa_pb_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cheggaaa/pb/v3",
        sha256 = "1dbcbfbc4edfe2fe24ae27e3e7003583cccbfb67c75b78b7285ae360cd674888",
        strip_prefix = "github.com/cheggaaa/pb/v3@v3.0.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cheggaaa/pb/v3/com_github_cheggaaa_pb_v3-v3.0.8.zip",
            "http://ats.apps.svc/gomod/github.com/cheggaaa/pb/v3/com_github_cheggaaa_pb_v3-v3.0.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cheggaaa/pb/v3/com_github_cheggaaa_pb_v3-v3.0.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cheggaaa/pb/v3/com_github_cheggaaa_pb_v3-v3.0.8.zip",
        ],
    )
    go_repository(
        name = "com_github_cheynewallace_tabby",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cheynewallace/tabby",
        sha256 = "8d58c5f49571b35da7a88224744cfb145fe8aa40b5a84c3e203c491f846e70c1",
        strip_prefix = "github.com/cheynewallace/tabby@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cheynewallace/tabby/com_github_cheynewallace_tabby-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/cheynewallace/tabby/com_github_cheynewallace_tabby-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cheynewallace/tabby/com_github_cheynewallace_tabby-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cheynewallace/tabby/com_github_cheynewallace_tabby-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_chzyer_logex",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/chzyer/logex",
        sha256 = "2c94771c1e335a2c58a96444b3768b8e00297747d6ce7e7c14bab2e8b39d91bd",
        strip_prefix = "github.com/chzyer/logex@v1.1.10",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/chzyer/logex/com_github_chzyer_logex-v1.1.10.zip",
            "http://ats.apps.svc/gomod/github.com/chzyer/logex/com_github_chzyer_logex-v1.1.10.zip",
            "https://cache.hawkingrei.com/gomod/github.com/chzyer/logex/com_github_chzyer_logex-v1.1.10.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/chzyer/logex/com_github_chzyer_logex-v1.1.10.zip",
        ],
    )
    go_repository(
        name = "com_github_chzyer_readline",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/chzyer/readline",
        sha256 = "ce25854a8beae5c20bdde840d5142e6fbd1f86f0e58442705b8fb21dfce48501",
        strip_prefix = "github.com/chzyer/readline@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/chzyer/readline/com_github_chzyer_readline-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/chzyer/readline/com_github_chzyer_readline-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/chzyer/readline/com_github_chzyer_readline-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/chzyer/readline/com_github_chzyer_readline-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_chzyer_test",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/chzyer/test",
        sha256 = "ad8550bed3c4a94bbef57b9fc5bb15806eaceda00925716404320580d60e2f7d",
        strip_prefix = "github.com/chzyer/test@v0.0.0-20180213035817-a1ea475d72b1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/chzyer/test/com_github_chzyer_test-v0.0.0-20180213035817-a1ea475d72b1.zip",
            "http://ats.apps.svc/gomod/github.com/chzyer/test/com_github_chzyer_test-v0.0.0-20180213035817-a1ea475d72b1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/chzyer/test/com_github_chzyer_test-v0.0.0-20180213035817-a1ea475d72b1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/chzyer/test/com_github_chzyer_test-v0.0.0-20180213035817-a1ea475d72b1.zip",
        ],
    )
    go_repository(
        name = "com_github_cilium_ebpf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cilium/ebpf",
        sha256 = "5130d073e34b07b80ecf6cccb1ff4b20ecee59bf1b5b71272ef9e90949a85952",
        strip_prefix = "github.com/cilium/ebpf@v0.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cilium/ebpf/com_github_cilium_ebpf-v0.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/cilium/ebpf/com_github_cilium_ebpf-v0.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cilium/ebpf/com_github_cilium_ebpf-v0.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cilium/ebpf/com_github_cilium_ebpf-v0.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ckaznocha_intrange",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ckaznocha/intrange",
        sha256 = "1243687d06ed92176bc21f366cd524aa4d5debda33ba6db9320261fd17cee22c",
        strip_prefix = "github.com/ckaznocha/intrange@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ckaznocha/intrange/com_github_ckaznocha_intrange-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/ckaznocha/intrange/com_github_ckaznocha_intrange-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ckaznocha/intrange/com_github_ckaznocha_intrange-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ckaznocha/intrange/com_github_ckaznocha_intrange-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_client9_misspell",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/client9/misspell",
        sha256 = "a3af206372e131dd10a68ac470c66a1b18eaf51c6afacb55b2e2a06e39b90728",
        strip_prefix = "github.com/client9/misspell@v0.3.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/client9/misspell/com_github_client9_misspell-v0.3.4.zip",
            "http://ats.apps.svc/gomod/github.com/client9/misspell/com_github_client9_misspell-v0.3.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/client9/misspell/com_github_client9_misspell-v0.3.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/client9/misspell/com_github_client9_misspell-v0.3.4.zip",
        ],
    )
    go_repository(
        name = "com_github_cloudfoundry_gosigar",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cloudfoundry/gosigar",
        sha256 = "44bd2b560d804fe98453100d6adfc4dd9c92f76713cfb543700a347317d5dc11",
        strip_prefix = "github.com/cloudfoundry/gosigar@v1.3.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cloudfoundry/gosigar/com_github_cloudfoundry_gosigar-v1.3.6.zip",
            "http://ats.apps.svc/gomod/github.com/cloudfoundry/gosigar/com_github_cloudfoundry_gosigar-v1.3.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cloudfoundry/gosigar/com_github_cloudfoundry_gosigar-v1.3.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cloudfoundry/gosigar/com_github_cloudfoundry_gosigar-v1.3.6.zip",
        ],
    )
    go_repository(
        name = "com_github_cloudykit_fastprinter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/CloudyKit/fastprinter",
        sha256 = "7e6015de3e986e5de8bf7310887bb0d8c1c33d66c5aacbd706aeec524dfda765",
        strip_prefix = "github.com/CloudyKit/fastprinter@v0.0.0-20200109182630-33d98a066a53",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/CloudyKit/fastprinter/com_github_cloudykit_fastprinter-v0.0.0-20200109182630-33d98a066a53.zip",
            "http://ats.apps.svc/gomod/github.com/CloudyKit/fastprinter/com_github_cloudykit_fastprinter-v0.0.0-20200109182630-33d98a066a53.zip",
            "https://cache.hawkingrei.com/gomod/github.com/CloudyKit/fastprinter/com_github_cloudykit_fastprinter-v0.0.0-20200109182630-33d98a066a53.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/CloudyKit/fastprinter/com_github_cloudykit_fastprinter-v0.0.0-20200109182630-33d98a066a53.zip",
        ],
    )
    go_repository(
        name = "com_github_cloudykit_jet_v6",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/CloudyKit/jet/v6",
        sha256 = "24c18e2a19eb56a01fce96e2504196f85d1c2291ff448f20dd32f6247a979264",
        strip_prefix = "github.com/CloudyKit/jet/v6@v6.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/CloudyKit/jet/v6/com_github_cloudykit_jet_v6-v6.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/CloudyKit/jet/v6/com_github_cloudykit_jet_v6-v6.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/CloudyKit/jet/v6/com_github_cloudykit_jet_v6-v6.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/CloudyKit/jet/v6/com_github_cloudykit_jet_v6-v6.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_cncf_udpa_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cncf/udpa/go",
        sha256 = "a449fa94e58117a79c17577e39f72f695c4876f74cbd9142d512278192ca90aa",
        strip_prefix = "github.com/cncf/udpa/go@v0.0.0-20210930031921-04548b0d99d4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cncf/udpa/go/com_github_cncf_udpa_go-v0.0.0-20210930031921-04548b0d99d4.zip",
            "http://ats.apps.svc/gomod/github.com/cncf/udpa/go/com_github_cncf_udpa_go-v0.0.0-20210930031921-04548b0d99d4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cncf/udpa/go/com_github_cncf_udpa_go-v0.0.0-20210930031921-04548b0d99d4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cncf/udpa/go/com_github_cncf_udpa_go-v0.0.0-20210930031921-04548b0d99d4.zip",
        ],
    )
    go_repository(
        name = "com_github_cncf_xds_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cncf/xds/go",
        sha256 = "ab0d2fd980b15a582708a728cf8080ebb88778e59f3003b67c6aafaa9ad0f447",
        strip_prefix = "github.com/cncf/xds/go@v0.0.0-20231128003011-0fa0005c9caa",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cncf/xds/go/com_github_cncf_xds_go-v0.0.0-20231128003011-0fa0005c9caa.zip",
            "http://ats.apps.svc/gomod/github.com/cncf/xds/go/com_github_cncf_xds_go-v0.0.0-20231128003011-0fa0005c9caa.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cncf/xds/go/com_github_cncf_xds_go-v0.0.0-20231128003011-0fa0005c9caa.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cncf/xds/go/com_github_cncf_xds_go-v0.0.0-20231128003011-0fa0005c9caa.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_datadriven",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/datadriven",
        sha256 = "f6de9c180e1ea80c602d98247b8e8fe89f491648ab1425417b9aca082697cbc0",
        strip_prefix = "github.com/cockroachdb/datadriven@v1.0.3-0.20230413201302-be42291fc80f",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/datadriven/com_github_cockroachdb_datadriven-v1.0.3-0.20230413201302-be42291fc80f.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/datadriven/com_github_cockroachdb_datadriven-v1.0.3-0.20230413201302-be42291fc80f.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/datadriven/com_github_cockroachdb_datadriven-v1.0.3-0.20230413201302-be42291fc80f.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/datadriven/com_github_cockroachdb_datadriven-v1.0.3-0.20230413201302-be42291fc80f.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/errors",
        sha256 = "d11ed59d96afef2d1f0ce56892839c62ff5c0cbca8dff0aaefeaef7eb190e73c",
        strip_prefix = "github.com/cockroachdb/errors@v1.11.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/errors/com_github_cockroachdb_errors-v1.11.3.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/errors/com_github_cockroachdb_errors-v1.11.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/errors/com_github_cockroachdb_errors-v1.11.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/errors/com_github_cockroachdb_errors-v1.11.3.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_fifo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/fifo",
        sha256 = "41e682b393cc82891ab5fcefbd28cc6173f16887702ab8760bcbc66d122e5900",
        strip_prefix = "github.com/cockroachdb/fifo@v0.0.0-20240606204812-0bbfbd93a7ce",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/fifo/com_github_cockroachdb_fifo-v0.0.0-20240606204812-0bbfbd93a7ce.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/fifo/com_github_cockroachdb_fifo-v0.0.0-20240606204812-0bbfbd93a7ce.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/fifo/com_github_cockroachdb_fifo-v0.0.0-20240606204812-0bbfbd93a7ce.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/fifo/com_github_cockroachdb_fifo-v0.0.0-20240606204812-0bbfbd93a7ce.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_logtags",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/logtags",
        sha256 = "ca7776f47e5fecb4c495490a679036bfc29d95bd7625290cfdb9abb0baf97476",
        strip_prefix = "github.com/cockroachdb/logtags@v0.0.0-20230118201751-21c54148d20b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/logtags/com_github_cockroachdb_logtags-v0.0.0-20230118201751-21c54148d20b.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/logtags/com_github_cockroachdb_logtags-v0.0.0-20230118201751-21c54148d20b.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/logtags/com_github_cockroachdb_logtags-v0.0.0-20230118201751-21c54148d20b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/logtags/com_github_cockroachdb_logtags-v0.0.0-20230118201751-21c54148d20b.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_pebble",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/pebble",
        sha256 = "d0dd0414c6526fed82e3c9558c40890529db0e9f8c33553f228d34e91ed7a906",
        strip_prefix = "github.com/cockroachdb/pebble@v1.1.4-0.20250120151818-5dd133a1e6fb",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/pebble/com_github_cockroachdb_pebble-v1.1.4-0.20250120151818-5dd133a1e6fb.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/pebble/com_github_cockroachdb_pebble-v1.1.4-0.20250120151818-5dd133a1e6fb.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/pebble/com_github_cockroachdb_pebble-v1.1.4-0.20250120151818-5dd133a1e6fb.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/pebble/com_github_cockroachdb_pebble-v1.1.4-0.20250120151818-5dd133a1e6fb.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_redact",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/redact",
        sha256 = "11b30528eb0dafc8bc1a5ba39d81277c257cbe6946a7564402f588357c164560",
        strip_prefix = "github.com/cockroachdb/redact@v1.1.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/redact/com_github_cockroachdb_redact-v1.1.5.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/redact/com_github_cockroachdb_redact-v1.1.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/redact/com_github_cockroachdb_redact-v1.1.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/redact/com_github_cockroachdb_redact-v1.1.5.zip",
        ],
    )
    go_repository(
        name = "com_github_cockroachdb_tokenbucket",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cockroachdb/tokenbucket",
        sha256 = "150f3e8e5b515c0886cda0809f09b5d5173d7f2c30eb2f2c6045c2aeb2183aa3",
        strip_prefix = "github.com/cockroachdb/tokenbucket@v0.0.0-20230807174530-cc333fc44b06",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cockroachdb/tokenbucket/com_github_cockroachdb_tokenbucket-v0.0.0-20230807174530-cc333fc44b06.zip",
            "http://ats.apps.svc/gomod/github.com/cockroachdb/tokenbucket/com_github_cockroachdb_tokenbucket-v0.0.0-20230807174530-cc333fc44b06.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cockroachdb/tokenbucket/com_github_cockroachdb_tokenbucket-v0.0.0-20230807174530-cc333fc44b06.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cockroachdb/tokenbucket/com_github_cockroachdb_tokenbucket-v0.0.0-20230807174530-cc333fc44b06.zip",
        ],
    )
    go_repository(
        name = "com_github_code_hex_go_generics_cache",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Code-Hex/go-generics-cache",
        sha256 = "e545aab31a9ce268856afe920755ad0774289642eaa4b57a3d57eb003827eda0",
        strip_prefix = "github.com/Code-Hex/go-generics-cache@v1.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Code-Hex/go-generics-cache/com_github_code_hex_go_generics_cache-v1.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/Code-Hex/go-generics-cache/com_github_code_hex_go_generics_cache-v1.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Code-Hex/go-generics-cache/com_github_code_hex_go_generics_cache-v1.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Code-Hex/go-generics-cache/com_github_code_hex_go_generics_cache-v1.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_codegangsta_inject",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/codegangsta/inject",
        sha256 = "0a324d56992bffd288fa70a6d10eb9b8a9467665b0b1eb749ac6ae80e8977ee2",
        strip_prefix = "github.com/codegangsta/inject@v0.0.0-20150114235600-33e0aa1cb7c0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/codegangsta/inject/com_github_codegangsta_inject-v0.0.0-20150114235600-33e0aa1cb7c0.zip",
            "http://ats.apps.svc/gomod/github.com/codegangsta/inject/com_github_codegangsta_inject-v0.0.0-20150114235600-33e0aa1cb7c0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/codegangsta/inject/com_github_codegangsta_inject-v0.0.0-20150114235600-33e0aa1cb7c0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/codegangsta/inject/com_github_codegangsta_inject-v0.0.0-20150114235600-33e0aa1cb7c0.zip",
        ],
    )
    go_repository(
        name = "com_github_colinmarc_hdfs_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/colinmarc/hdfs/v2",
        sha256 = "6a40084f999e3ddbd9a8566b1333646424201fc2ad28aa1a40ddf51aaf8fbc51",
        strip_prefix = "github.com/colinmarc/hdfs/v2@v2.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/colinmarc/hdfs/v2/com_github_colinmarc_hdfs_v2-v2.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/colinmarc/hdfs/v2/com_github_colinmarc_hdfs_v2-v2.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/colinmarc/hdfs/v2/com_github_colinmarc_hdfs_v2-v2.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/colinmarc/hdfs/v2/com_github_colinmarc_hdfs_v2-v2.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_containerd_cgroups_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/containerd/cgroups/v3",
        sha256 = "bc22dd9c675f1abd77a9de83506abb15656529848b2274323a88ea9bfce980be",
        strip_prefix = "github.com/containerd/cgroups/v3@v3.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/containerd/cgroups/v3/com_github_containerd_cgroups_v3-v3.0.3.zip",
            "http://ats.apps.svc/gomod/github.com/containerd/cgroups/v3/com_github_containerd_cgroups_v3-v3.0.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/containerd/cgroups/v3/com_github_containerd_cgroups_v3-v3.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/containerd/cgroups/v3/com_github_containerd_cgroups_v3-v3.0.3.zip",
        ],
    )
    go_repository(
        name = "com_github_containerd_log",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/containerd/log",
        sha256 = "2008faf206ec820e7fc3d40baba924936c21347dafad4a7ff122fa90e26e57d7",
        strip_prefix = "github.com/containerd/log@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/containerd/log/com_github_containerd_log-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/containerd/log/com_github_containerd_log-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/containerd/log/com_github_containerd_log-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/containerd/log/com_github_containerd_log-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_coocood_bbloom",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coocood/bbloom",
        sha256 = "95b9a3b14d92069c4cd70942cf693db8abef720d7a38521cafb7323077e72d55",
        strip_prefix = "github.com/coocood/bbloom@v0.0.0-20190830030839-58deb6228d64",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coocood/bbloom/com_github_coocood_bbloom-v0.0.0-20190830030839-58deb6228d64.zip",
            "http://ats.apps.svc/gomod/github.com/coocood/bbloom/com_github_coocood_bbloom-v0.0.0-20190830030839-58deb6228d64.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coocood/bbloom/com_github_coocood_bbloom-v0.0.0-20190830030839-58deb6228d64.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coocood/bbloom/com_github_coocood_bbloom-v0.0.0-20190830030839-58deb6228d64.zip",
        ],
    )
    go_repository(
        name = "com_github_coocood_freecache",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coocood/freecache",
        sha256 = "e0f3b9924ea5919fbae2043680d6e6ae6bac8e9765159aa9ba2a67a4b8dd43ca",
        strip_prefix = "github.com/coocood/freecache@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coocood/freecache/com_github_coocood_freecache-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/coocood/freecache/com_github_coocood_freecache-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coocood/freecache/com_github_coocood_freecache-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coocood/freecache/com_github_coocood_freecache-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_coocood_rtutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coocood/rtutil",
        sha256 = "0a48ef669128ba717cc35afc270aa74d93cbb9837ed007e7d00344d4daeb2699",
        strip_prefix = "github.com/coocood/rtutil@v0.0.0-20190304133409-c84515f646f2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coocood/rtutil/com_github_coocood_rtutil-v0.0.0-20190304133409-c84515f646f2.zip",
            "http://ats.apps.svc/gomod/github.com/coocood/rtutil/com_github_coocood_rtutil-v0.0.0-20190304133409-c84515f646f2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coocood/rtutil/com_github_coocood_rtutil-v0.0.0-20190304133409-c84515f646f2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coocood/rtutil/com_github_coocood_rtutil-v0.0.0-20190304133409-c84515f646f2.zip",
        ],
    )
    go_repository(
        name = "com_github_coreos_etcd",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coreos/etcd",
        sha256 = "6d4f268491a5e80078b3f80a94a8780c3c04bad50efb371ef10bbc80652ec122",
        strip_prefix = "github.com/coreos/etcd@v3.3.10+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coreos/etcd/com_github_coreos_etcd-v3.3.10+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/coreos/etcd/com_github_coreos_etcd-v3.3.10+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coreos/etcd/com_github_coreos_etcd-v3.3.10+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coreos/etcd/com_github_coreos_etcd-v3.3.10+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_coreos_go_etcd",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coreos/go-etcd",
        sha256 = "4b226732835b9298af65db5d075024a5971aa11ef4b456899a3830bccd435b07",
        strip_prefix = "github.com/coreos/go-etcd@v2.0.0+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coreos/go-etcd/com_github_coreos_go_etcd-v2.0.0+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/coreos/go-etcd/com_github_coreos_go_etcd-v2.0.0+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coreos/go-etcd/com_github_coreos_go_etcd-v2.0.0+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coreos/go-etcd/com_github_coreos_go_etcd-v2.0.0+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_coreos_go_semver",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coreos/go-semver",
        sha256 = "e72820542b5913afe0a52e956e0b3834e9fbb080641fed183117f862fab74e8a",
        strip_prefix = "github.com/coreos/go-semver@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coreos/go-semver/com_github_coreos_go_semver-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/coreos/go-semver/com_github_coreos_go_semver-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coreos/go-semver/com_github_coreos_go_semver-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coreos/go-semver/com_github_coreos_go_semver-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_coreos_go_systemd_v22",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/coreos/go-systemd/v22",
        sha256 = "4c44e3a6b84de4db393e341537c7124031fa98d5f98860ad31b32b4890f2234c",
        strip_prefix = "github.com/coreos/go-systemd/v22@v22.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/coreos/go-systemd/v22/com_github_coreos_go_systemd_v22-v22.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/coreos/go-systemd/v22/com_github_coreos_go_systemd_v22-v22.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/coreos/go-systemd/v22/com_github_coreos_go_systemd_v22-v22.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/coreos/go-systemd/v22/com_github_coreos_go_systemd_v22-v22.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_cpuguy83_go_md2man",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cpuguy83/go-md2man",
        sha256 = "b9b153bb97e2a702ec5c41f6815985d4295524cdf4f2a9e5633f98e9739f4d6e",
        strip_prefix = "github.com/cpuguy83/go-md2man@v1.0.10",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cpuguy83/go-md2man/com_github_cpuguy83_go_md2man-v1.0.10.zip",
            "http://ats.apps.svc/gomod/github.com/cpuguy83/go-md2man/com_github_cpuguy83_go_md2man-v1.0.10.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cpuguy83/go-md2man/com_github_cpuguy83_go_md2man-v1.0.10.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cpuguy83/go-md2man/com_github_cpuguy83_go_md2man-v1.0.10.zip",
        ],
    )
    go_repository(
        name = "com_github_cpuguy83_go_md2man_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cpuguy83/go-md2man/v2",
        sha256 = "b8059316e38bcfd28b69d2c2b32d34b9e800ccaa1ff4b5a61022cbe98fa7c710",
        strip_prefix = "github.com/cpuguy83/go-md2man/v2@v2.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cpuguy83/go-md2man/v2/com_github_cpuguy83_go_md2man_v2-v2.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/cpuguy83/go-md2man/v2/com_github_cpuguy83_go_md2man_v2-v2.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cpuguy83/go-md2man/v2/com_github_cpuguy83_go_md2man_v2-v2.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cpuguy83/go-md2man/v2/com_github_cpuguy83_go_md2man_v2-v2.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_creack_pty",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/creack/pty",
        sha256 = "d6594fd4844c242a5c7d6e9b25516182460cffa820e47e8ffb8eea625991986c",
        strip_prefix = "github.com/creack/pty@v1.1.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/creack/pty/com_github_creack_pty-v1.1.11.zip",
            "http://ats.apps.svc/gomod/github.com/creack/pty/com_github_creack_pty-v1.1.11.zip",
            "https://cache.hawkingrei.com/gomod/github.com/creack/pty/com_github_creack_pty-v1.1.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/creack/pty/com_github_creack_pty-v1.1.11.zip",
        ],
    )
    go_repository(
        name = "com_github_curioswitch_go_reassign",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/curioswitch/go-reassign",
        sha256 = "b933160fb022da09a8134c4e8bee7d616bceee7aa161f011eaabd9f2c264b735",
        strip_prefix = "github.com/curioswitch/go-reassign@v0.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/curioswitch/go-reassign/com_github_curioswitch_go_reassign-v0.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/curioswitch/go-reassign/com_github_curioswitch_go_reassign-v0.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/curioswitch/go-reassign/com_github_curioswitch_go_reassign-v0.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/curioswitch/go-reassign/com_github_curioswitch_go_reassign-v0.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_cznic_mathutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cznic/mathutil",
        sha256 = "8f69a36f60d885e011b0a90b91246a7e88223cb2883dc6e71eab3f42d653231b",
        strip_prefix = "github.com/cznic/mathutil@v0.0.0-20181122101859-297441e03548",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cznic/mathutil/com_github_cznic_mathutil-v0.0.0-20181122101859-297441e03548.zip",
            "http://ats.apps.svc/gomod/github.com/cznic/mathutil/com_github_cznic_mathutil-v0.0.0-20181122101859-297441e03548.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cznic/mathutil/com_github_cznic_mathutil-v0.0.0-20181122101859-297441e03548.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cznic/mathutil/com_github_cznic_mathutil-v0.0.0-20181122101859-297441e03548.zip",
        ],
    )
    go_repository(
        name = "com_github_cznic_sortutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cznic/sortutil",
        sha256 = "67783879c1ae4472fdabb377b1772e4e4c5ced181528c2fc4569b565cb47a57b",
        strip_prefix = "github.com/cznic/sortutil@v0.0.0-20181122101858-f5f958428db8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cznic/sortutil/com_github_cznic_sortutil-v0.0.0-20181122101858-f5f958428db8.zip",
            "http://ats.apps.svc/gomod/github.com/cznic/sortutil/com_github_cznic_sortutil-v0.0.0-20181122101858-f5f958428db8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cznic/sortutil/com_github_cznic_sortutil-v0.0.0-20181122101858-f5f958428db8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cznic/sortutil/com_github_cznic_sortutil-v0.0.0-20181122101858-f5f958428db8.zip",
        ],
    )
    go_repository(
        name = "com_github_cznic_strutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/cznic/strutil",
        sha256 = "867902276444cbffca84d9d5f63754e8b22092d93a94480d8dfebd234ac8ffbd",
        strip_prefix = "github.com/cznic/strutil@v0.0.0-20181122101858-275e90344537",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/cznic/strutil/com_github_cznic_strutil-v0.0.0-20181122101858-275e90344537.zip",
            "http://ats.apps.svc/gomod/github.com/cznic/strutil/com_github_cznic_strutil-v0.0.0-20181122101858-275e90344537.zip",
            "https://cache.hawkingrei.com/gomod/github.com/cznic/strutil/com_github_cznic_strutil-v0.0.0-20181122101858-275e90344537.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/cznic/strutil/com_github_cznic_strutil-v0.0.0-20181122101858-275e90344537.zip",
        ],
    )
    go_repository(
        name = "com_github_daixiang0_gci",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/daixiang0/gci",
        sha256 = "7966444aa312d966da6207335143375faeb63fdd646a1adc16c6e76bf1892dbb",
        strip_prefix = "github.com/daixiang0/gci@v0.13.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/daixiang0/gci/com_github_daixiang0_gci-v0.13.6.zip",
            "http://ats.apps.svc/gomod/github.com/daixiang0/gci/com_github_daixiang0_gci-v0.13.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/daixiang0/gci/com_github_daixiang0_gci-v0.13.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/daixiang0/gci/com_github_daixiang0_gci-v0.13.6.zip",
        ],
    )
    go_repository(
        name = "com_github_danjacques_gofslock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/danjacques/gofslock",
        sha256 = "a5883b567196955c9b588bcfa8f21bf841e9234225c8437a0b84104ecc4a3b19",
        strip_prefix = "github.com/danjacques/gofslock@v0.0.0-20191023191349-0a45f885bc37",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/danjacques/gofslock/com_github_danjacques_gofslock-v0.0.0-20191023191349-0a45f885bc37.zip",
            "http://ats.apps.svc/gomod/github.com/danjacques/gofslock/com_github_danjacques_gofslock-v0.0.0-20191023191349-0a45f885bc37.zip",
            "https://cache.hawkingrei.com/gomod/github.com/danjacques/gofslock/com_github_danjacques_gofslock-v0.0.0-20191023191349-0a45f885bc37.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/danjacques/gofslock/com_github_danjacques_gofslock-v0.0.0-20191023191349-0a45f885bc37.zip",
        ],
    )
    go_repository(
        name = "com_github_data_dog_go_sqlmock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/DATA-DOG/go-sqlmock",
        sha256 = "25720bfcbd739305238408ab54263224b69ff6934923dfd9caed76d3871d0151",
        strip_prefix = "github.com/DATA-DOG/go-sqlmock@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/DATA-DOG/go-sqlmock/com_github_data_dog_go_sqlmock-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/DATA-DOG/go-sqlmock/com_github_data_dog_go_sqlmock-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/DATA-DOG/go-sqlmock/com_github_data_dog_go_sqlmock-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/DATA-DOG/go-sqlmock/com_github_data_dog_go_sqlmock-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_datadog_zstd",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/DataDog/zstd",
        sha256 = "adc8a6769baafad1b568583477cc49bf14883da9c24b978770faa06314e0c3f3",
        strip_prefix = "github.com/DataDog/zstd@v1.5.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/DataDog/zstd/com_github_datadog_zstd-v1.5.5.zip",
            "http://ats.apps.svc/gomod/github.com/DataDog/zstd/com_github_datadog_zstd-v1.5.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/DataDog/zstd/com_github_datadog_zstd-v1.5.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/DataDog/zstd/com_github_datadog_zstd-v1.5.5.zip",
        ],
    )
    go_repository(
        name = "com_github_dave_dst",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dave/dst",
        sha256 = "b682472decb3dc1d618df96a22467326de225676c608c0be50eb6c13b03d1f98",
        strip_prefix = "github.com/dave/dst@v0.27.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dave/dst/com_github_dave_dst-v0.27.3.zip",
            "http://ats.apps.svc/gomod/github.com/dave/dst/com_github_dave_dst-v0.27.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dave/dst/com_github_dave_dst-v0.27.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dave/dst/com_github_dave_dst-v0.27.3.zip",
        ],
    )
    go_repository(
        name = "com_github_davecgh_go_spew",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/davecgh/go-spew",
        sha256 = "b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128",
        strip_prefix = "github.com/davecgh/go-spew@v1.1.2-0.20180830191138-d8f796af33cc",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/davecgh/go-spew/com_github_davecgh_go_spew-v1.1.2-0.20180830191138-d8f796af33cc.zip",
            "http://ats.apps.svc/gomod/github.com/davecgh/go-spew/com_github_davecgh_go_spew-v1.1.2-0.20180830191138-d8f796af33cc.zip",
            "https://cache.hawkingrei.com/gomod/github.com/davecgh/go-spew/com_github_davecgh_go_spew-v1.1.2-0.20180830191138-d8f796af33cc.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/davecgh/go-spew/com_github_davecgh_go_spew-v1.1.2-0.20180830191138-d8f796af33cc.zip",
        ],
    )
    go_repository(
        name = "com_github_decred_dcrd_crypto_blake256",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/decred/dcrd/crypto/blake256",
        sha256 = "e4343d55494a93eb7bb7b59be9359fb8007fd36652b27a725db024f61605d515",
        strip_prefix = "github.com/decred/dcrd/crypto/blake256@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/decred/dcrd/crypto/blake256/com_github_decred_dcrd_crypto_blake256-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/decred/dcrd/crypto/blake256/com_github_decred_dcrd_crypto_blake256-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/decred/dcrd/crypto/blake256/com_github_decred_dcrd_crypto_blake256-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/decred/dcrd/crypto/blake256/com_github_decred_dcrd_crypto_blake256-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_decred_dcrd_dcrec_secp256k1_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/decred/dcrd/dcrec/secp256k1/v4",
        sha256 = "9b3594cedab7e820108cd9f2f7f17a9edf60345baf91f7e1bd298413dba44c63",
        strip_prefix = "github.com/decred/dcrd/dcrec/secp256k1/v4@v4.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/decred/dcrd/dcrec/secp256k1/v4/com_github_decred_dcrd_dcrec_secp256k1_v4-v4.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/decred/dcrd/dcrec/secp256k1/v4/com_github_decred_dcrd_dcrec_secp256k1_v4-v4.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/decred/dcrd/dcrec/secp256k1/v4/com_github_decred_dcrd_dcrec_secp256k1_v4-v4.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/decred/dcrd/dcrec/secp256k1/v4/com_github_decred_dcrd_dcrec_secp256k1_v4-v4.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_denis_tingaikin_go_header",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/denis-tingaikin/go-header",
        sha256 = "9144aa83f8b2d5666f68dbfb37a252e38fb0bef32b1de48b6db8b6f45a2d8cbb",
        strip_prefix = "github.com/denis-tingaikin/go-header@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/denis-tingaikin/go-header/com_github_denis_tingaikin_go_header-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/denis-tingaikin/go-header/com_github_denis_tingaikin_go_header-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/denis-tingaikin/go-header/com_github_denis_tingaikin_go_header-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/denis-tingaikin/go-header/com_github_denis_tingaikin_go_header-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_dennwc_varint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dennwc/varint",
        sha256 = "2918e66c0fb5a82dbfc8cca1ed34cb8ccff8188e876c0ca25f85b8247e53626f",
        strip_prefix = "github.com/dennwc/varint@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dennwc/varint/com_github_dennwc_varint-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/dennwc/varint/com_github_dennwc_varint-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dennwc/varint/com_github_dennwc_varint-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dennwc/varint/com_github_dennwc_varint-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_dgraph_io_ristretto",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dgraph-io/ristretto",
        sha256 = "fe7bd94580481fd4a25a72becb8b30c60142492a3e83320e1bbc4262baa533da",
        strip_prefix = "github.com/dgraph-io/ristretto@v0.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dgraph-io/ristretto/com_github_dgraph_io_ristretto-v0.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/dgraph-io/ristretto/com_github_dgraph_io_ristretto-v0.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dgraph-io/ristretto/com_github_dgraph_io_ristretto-v0.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dgraph-io/ristretto/com_github_dgraph_io_ristretto-v0.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_dgryski_go_farm",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dgryski/go-farm",
        sha256 = "e933606e2e726e6f07db98d1ce0ce38b3af3bdbb85c384f4f7eb3607cf00525f",
        strip_prefix = "github.com/dgryski/go-farm@v0.0.0-20240924180020-3414d57e47da",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dgryski/go-farm/com_github_dgryski_go_farm-v0.0.0-20240924180020-3414d57e47da.zip",
            "http://ats.apps.svc/gomod/github.com/dgryski/go-farm/com_github_dgryski_go_farm-v0.0.0-20240924180020-3414d57e47da.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dgryski/go-farm/com_github_dgryski_go_farm-v0.0.0-20240924180020-3414d57e47da.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dgryski/go-farm/com_github_dgryski_go_farm-v0.0.0-20240924180020-3414d57e47da.zip",
        ],
    )
    go_repository(
        name = "com_github_digitalocean_godo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/digitalocean/godo",
        sha256 = "05d6f193e8313915fbea712226612a8d0bdc8e61975564262982b6ca106d38ee",
        strip_prefix = "github.com/digitalocean/godo@v1.108.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/digitalocean/godo/com_github_digitalocean_godo-v1.108.0.zip",
            "http://ats.apps.svc/gomod/github.com/digitalocean/godo/com_github_digitalocean_godo-v1.108.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/digitalocean/godo/com_github_digitalocean_godo-v1.108.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/digitalocean/godo/com_github_digitalocean_godo-v1.108.0.zip",
        ],
    )
    go_repository(
        name = "com_github_distribution_reference",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/distribution/reference",
        sha256 = "d812d0281581beb04facbd0ca03bc529ae7de484f959ade09765c1af532e1b7c",
        strip_prefix = "github.com/distribution/reference@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/distribution/reference/com_github_distribution_reference-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/distribution/reference/com_github_distribution_reference-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/distribution/reference/com_github_distribution_reference-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/distribution/reference/com_github_distribution_reference-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_djarvur_go_err113",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Djarvur/go-err113",
        sha256 = "f2c6d8ae044f430048ae675330d2adcbe1927a8a369549d98c4d1e62608b582a",
        strip_prefix = "github.com/Djarvur/go-err113@v0.0.0-20210108212216-aea10b59be24",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Djarvur/go-err113/com_github_djarvur_go_err113-v0.0.0-20210108212216-aea10b59be24.zip",
            "http://ats.apps.svc/gomod/github.com/Djarvur/go-err113/com_github_djarvur_go_err113-v0.0.0-20210108212216-aea10b59be24.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Djarvur/go-err113/com_github_djarvur_go_err113-v0.0.0-20210108212216-aea10b59be24.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Djarvur/go-err113/com_github_djarvur_go_err113-v0.0.0-20210108212216-aea10b59be24.zip",
        ],
    )
    go_repository(
        name = "com_github_dlclark_regexp2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dlclark/regexp2",
        sha256 = "cb2418e33b59eaaf5f57874db895cb620833e7a5e6eaf5a2c2deef7d47b70610",
        strip_prefix = "github.com/dlclark/regexp2@v1.11.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dlclark/regexp2/com_github_dlclark_regexp2-v1.11.5.zip",
            "http://ats.apps.svc/gomod/github.com/dlclark/regexp2/com_github_dlclark_regexp2-v1.11.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dlclark/regexp2/com_github_dlclark_regexp2-v1.11.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dlclark/regexp2/com_github_dlclark_regexp2-v1.11.5.zip",
        ],
    )
    go_repository(
        name = "com_github_dnaeon_go_vcr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dnaeon/go-vcr",
        sha256 = "d6d94a1c8471809db30c2979add32bac647120bc577ea30f7e8fcc06436483f0",
        strip_prefix = "github.com/dnaeon/go-vcr@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dnaeon/go-vcr/com_github_dnaeon_go_vcr-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/dnaeon/go-vcr/com_github_dnaeon_go_vcr-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dnaeon/go-vcr/com_github_dnaeon_go_vcr-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dnaeon/go-vcr/com_github_dnaeon_go_vcr-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_docker_docker",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/docker/docker",
        sha256 = "943382432be5c45b64f779becb4d2c76a67727452b38a17a197a3c5d939f9cdc",
        strip_prefix = "github.com/docker/docker@v25.0.0+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/docker/docker/com_github_docker_docker-v25.0.0+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/docker/docker/com_github_docker_docker-v25.0.0+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/docker/docker/com_github_docker_docker-v25.0.0+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/docker/docker/com_github_docker_docker-v25.0.0+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_docker_go_connections",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/docker/go-connections",
        sha256 = "570ebcee7e6fd844e00c89eeab2b1922081d6969df76078dfe4ffacd3db56ada",
        strip_prefix = "github.com/docker/go-connections@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/docker/go-connections/com_github_docker_go_connections-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/docker/go-connections/com_github_docker_go_connections-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/docker/go-connections/com_github_docker_go_connections-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/docker/go-connections/com_github_docker_go_connections-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_docker_go_units",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/docker/go-units",
        sha256 = "039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6",
        strip_prefix = "github.com/docker/go-units@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/docker/go-units/com_github_docker_go_units-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/docker/go-units/com_github_docker_go_units-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/docker/go-units/com_github_docker_go_units-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/docker/go-units/com_github_docker_go_units-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_docopt_docopt_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/docopt/docopt-go",
        sha256 = "00aad861d150c62598ca4fb01cfbe15c2eefb5186df7e5d4a59286dcf09556c8",
        strip_prefix = "github.com/docopt/docopt-go@v0.0.0-20180111231733-ee0de3bc6815",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/docopt/docopt-go/com_github_docopt_docopt_go-v0.0.0-20180111231733-ee0de3bc6815.zip",
            "http://ats.apps.svc/gomod/github.com/docopt/docopt-go/com_github_docopt_docopt_go-v0.0.0-20180111231733-ee0de3bc6815.zip",
            "https://cache.hawkingrei.com/gomod/github.com/docopt/docopt-go/com_github_docopt_docopt_go-v0.0.0-20180111231733-ee0de3bc6815.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/docopt/docopt-go/com_github_docopt_docopt_go-v0.0.0-20180111231733-ee0de3bc6815.zip",
        ],
    )
    go_repository(
        name = "com_github_dolthub_maphash",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dolthub/maphash",
        sha256 = "ba69ef526a9613cb059c8490c1a4f032649879c316a1c4305e2355815eb32e41",
        strip_prefix = "github.com/dolthub/maphash@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dolthub/maphash/com_github_dolthub_maphash-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/dolthub/maphash/com_github_dolthub_maphash-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dolthub/maphash/com_github_dolthub_maphash-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dolthub/maphash/com_github_dolthub_maphash-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_dolthub_swiss",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dolthub/swiss",
        sha256 = "e911b7cea9aaed1255544fb8b53c19780f91b713e6d0fc71fb310232e4800dcc",
        strip_prefix = "github.com/dolthub/swiss@v0.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dolthub/swiss/com_github_dolthub_swiss-v0.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/dolthub/swiss/com_github_dolthub_swiss-v0.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dolthub/swiss/com_github_dolthub_swiss-v0.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dolthub/swiss/com_github_dolthub_swiss-v0.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_dustin_go_humanize",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/dustin/go-humanize",
        sha256 = "319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46",
        strip_prefix = "github.com/dustin/go-humanize@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/dustin/go-humanize/com_github_dustin_go_humanize-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/dustin/go-humanize/com_github_dustin_go_humanize-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/dustin/go-humanize/com_github_dustin_go_humanize-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/dustin/go-humanize/com_github_dustin_go_humanize-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ebitengine_purego",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ebitengine/purego",
        sha256 = "ebe52346f8e06cbfe85968a7d48731b77a260eed44875915b3de05ba7bc18380",
        strip_prefix = "github.com/ebitengine/purego@v0.8.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ebitengine/purego/com_github_ebitengine_purego-v0.8.4.zip",
            "http://ats.apps.svc/gomod/github.com/ebitengine/purego/com_github_ebitengine_purego-v0.8.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ebitengine/purego/com_github_ebitengine_purego-v0.8.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ebitengine/purego/com_github_ebitengine_purego-v0.8.4.zip",
        ],
    )
    go_repository(
        name = "com_github_edsrzf_mmap_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/edsrzf/mmap-go",
        sha256 = "1c2fa2b55d253fb95d4b253ec39348deba3d46a184bc0a4393a355807b8e5df7",
        strip_prefix = "github.com/edsrzf/mmap-go@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/edsrzf/mmap-go/com_github_edsrzf_mmap_go-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/edsrzf/mmap-go/com_github_edsrzf_mmap_go-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/edsrzf/mmap-go/com_github_edsrzf_mmap_go-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/edsrzf/mmap-go/com_github_edsrzf_mmap_go-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_eknkc_amber",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/eknkc/amber",
        sha256 = "b1dde9f3713742ad0961825a2d962bd99d9390daf8596e7680dfb5f395e54e22",
        strip_prefix = "github.com/eknkc/amber@v0.0.0-20171010120322-cdade1c07385",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/eknkc/amber/com_github_eknkc_amber-v0.0.0-20171010120322-cdade1c07385.zip",
            "http://ats.apps.svc/gomod/github.com/eknkc/amber/com_github_eknkc_amber-v0.0.0-20171010120322-cdade1c07385.zip",
            "https://cache.hawkingrei.com/gomod/github.com/eknkc/amber/com_github_eknkc_amber-v0.0.0-20171010120322-cdade1c07385.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/eknkc/amber/com_github_eknkc_amber-v0.0.0-20171010120322-cdade1c07385.zip",
        ],
    )
    go_repository(
        name = "com_github_emicklei_go_restful_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/emicklei/go-restful/v3",
        sha256 = "fc71c649398fa5d28ac7948d143bc8ac4803c01d24f852b9d50e87724ac8efc8",
        strip_prefix = "github.com/emicklei/go-restful/v3@v3.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/emicklei/go-restful/v3/com_github_emicklei_go_restful_v3-v3.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/emicklei/go-restful/v3/com_github_emicklei_go_restful_v3-v3.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/emicklei/go-restful/v3/com_github_emicklei_go_restful_v3-v3.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/emicklei/go-restful/v3/com_github_emicklei_go_restful_v3-v3.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_emirpasic_gods",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/emirpasic/gods",
        sha256 = "1d75e291ac15cf9ca2fcd8bd24e2f7203abad319cd3622cd1b19db5c4fb9daa5",
        strip_prefix = "github.com/emirpasic/gods@v1.18.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/emirpasic/gods/com_github_emirpasic_gods-v1.18.1.zip",
            "http://ats.apps.svc/gomod/github.com/emirpasic/gods/com_github_emirpasic_gods-v1.18.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/emirpasic/gods/com_github_emirpasic_gods-v1.18.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/emirpasic/gods/com_github_emirpasic_gods-v1.18.1.zip",
        ],
    )
    go_repository(
        name = "com_github_envoyproxy_go_control_plane",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/envoyproxy/go-control-plane",
        sha256 = "dc6b843aff8edab08ad7147b542a88ed8f6105ae8cad9b4c4f61acee4b784209",
        strip_prefix = "github.com/envoyproxy/go-control-plane@v0.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/envoyproxy/go-control-plane/com_github_envoyproxy_go_control_plane-v0.12.0.zip",
            "http://ats.apps.svc/gomod/github.com/envoyproxy/go-control-plane/com_github_envoyproxy_go_control_plane-v0.12.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/envoyproxy/go-control-plane/com_github_envoyproxy_go_control_plane-v0.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/envoyproxy/go-control-plane/com_github_envoyproxy_go_control_plane-v0.12.0.zip",
        ],
    )
    go_repository(
        name = "com_github_envoyproxy_protoc_gen_validate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/envoyproxy/protoc-gen-validate",
        sha256 = "8c7149e937f9750d7a3527396f0836aa28fcb070e067f2b99a0349c532403a03",
        strip_prefix = "github.com/envoyproxy/protoc-gen-validate@v1.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/envoyproxy/protoc-gen-validate/com_github_envoyproxy_protoc_gen_validate-v1.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/envoyproxy/protoc-gen-validate/com_github_envoyproxy_protoc_gen_validate-v1.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/envoyproxy/protoc-gen-validate/com_github_envoyproxy_protoc_gen_validate-v1.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/envoyproxy/protoc-gen-validate/com_github_envoyproxy_protoc_gen_validate-v1.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_etcd_io_gofail",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/etcd-io/gofail",
        sha256 = "4d73950b1116d15fed5bd1c5525439e633becd9f15539c27f5aab03a95a0a901",
        strip_prefix = "github.com/etcd-io/gofail@v0.0.0-20190801230047-ad7f989257ca",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/etcd-io/gofail/com_github_etcd_io_gofail-v0.0.0-20190801230047-ad7f989257ca.zip",
            "http://ats.apps.svc/gomod/github.com/etcd-io/gofail/com_github_etcd_io_gofail-v0.0.0-20190801230047-ad7f989257ca.zip",
            "https://cache.hawkingrei.com/gomod/github.com/etcd-io/gofail/com_github_etcd_io_gofail-v0.0.0-20190801230047-ad7f989257ca.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/etcd-io/gofail/com_github_etcd_io_gofail-v0.0.0-20190801230047-ad7f989257ca.zip",
        ],
    )
    go_repository(
        name = "com_github_ettle_strcase",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ettle/strcase",
        sha256 = "3b133509880af45108baefb655666e426e2a32adf6a4a660dac3eb06749df47b",
        strip_prefix = "github.com/ettle/strcase@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ettle/strcase/com_github_ettle_strcase-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/ettle/strcase/com_github_ettle_strcase-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ettle/strcase/com_github_ettle_strcase-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ettle/strcase/com_github_ettle_strcase-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_evanphx_json_patch",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/evanphx/json-patch",
        sha256 = "1105c2dc020fe36fa8ac02ad52f64c64291d9639c7108b6fc3da77299efd13f3",
        strip_prefix = "github.com/evanphx/json-patch@v5.6.0+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/evanphx/json-patch/com_github_evanphx_json_patch-v5.6.0+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/evanphx/json-patch/com_github_evanphx_json_patch-v5.6.0+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/evanphx/json-patch/com_github_evanphx_json_patch-v5.6.0+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/evanphx/json-patch/com_github_evanphx_json_patch-v5.6.0+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_facette_natsort",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/facette/natsort",
        sha256 = "08cd11112374bf6bf945345bfdede1141a0bb973706291016facc0508eca3ae7",
        strip_prefix = "github.com/facette/natsort@v0.0.0-20181210072756-2cd4dd1e2dcb",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/facette/natsort/com_github_facette_natsort-v0.0.0-20181210072756-2cd4dd1e2dcb.zip",
            "http://ats.apps.svc/gomod/github.com/facette/natsort/com_github_facette_natsort-v0.0.0-20181210072756-2cd4dd1e2dcb.zip",
            "https://cache.hawkingrei.com/gomod/github.com/facette/natsort/com_github_facette_natsort-v0.0.0-20181210072756-2cd4dd1e2dcb.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/facette/natsort/com_github_facette_natsort-v0.0.0-20181210072756-2cd4dd1e2dcb.zip",
        ],
    )
    go_repository(
        name = "com_github_fatih_color",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fatih/color",
        sha256 = "4dc6907b7f6807b37c21ad527d966437d398f03472115f471eaa8fe5875363d3",
        strip_prefix = "github.com/fatih/color@v1.18.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fatih/color/com_github_fatih_color-v1.18.0.zip",
            "http://ats.apps.svc/gomod/github.com/fatih/color/com_github_fatih_color-v1.18.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fatih/color/com_github_fatih_color-v1.18.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fatih/color/com_github_fatih_color-v1.18.0.zip",
        ],
    )
    go_repository(
        name = "com_github_fatih_structs",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fatih/structs",
        sha256 = "a361ecc95ad12000c66ee143d26b2aa0a4e5de3b045fd5d18a52564622a59148",
        strip_prefix = "github.com/fatih/structs@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fatih/structs/com_github_fatih_structs-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/fatih/structs/com_github_fatih_structs-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fatih/structs/com_github_fatih_structs-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fatih/structs/com_github_fatih_structs-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_fatih_structtag",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fatih/structtag",
        sha256 = "9fe0ed2128614a3c35c4149febde484cfae8c5ecb13c128957cfcdf2776dd1eb",
        strip_prefix = "github.com/fatih/structtag@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fatih/structtag/com_github_fatih_structtag-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/fatih/structtag/com_github_fatih_structtag-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fatih/structtag/com_github_fatih_structtag-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fatih/structtag/com_github_fatih_structtag-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_felixge_fgprof",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/felixge/fgprof",
        sha256 = "2c83268087acf8b767be69dbc37c099fa85856763c2e88fb99637d46eb6ac23c",
        strip_prefix = "github.com/felixge/fgprof@v0.9.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/felixge/fgprof/com_github_felixge_fgprof-v0.9.3.zip",
            "http://ats.apps.svc/gomod/github.com/felixge/fgprof/com_github_felixge_fgprof-v0.9.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/felixge/fgprof/com_github_felixge_fgprof-v0.9.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/felixge/fgprof/com_github_felixge_fgprof-v0.9.3.zip",
        ],
    )
    go_repository(
        name = "com_github_felixge_httpsnoop",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/felixge/httpsnoop",
        sha256 = "75aa471311265e9860df0e523400b4650ed0c1a33262786a421f07226792e494",
        strip_prefix = "github.com/felixge/httpsnoop@v1.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/felixge/httpsnoop/com_github_felixge_httpsnoop-v1.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/felixge/httpsnoop/com_github_felixge_httpsnoop-v1.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/felixge/httpsnoop/com_github_felixge_httpsnoop-v1.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/felixge/httpsnoop/com_github_felixge_httpsnoop-v1.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_firefart_nonamedreturns",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/firefart/nonamedreturns",
        sha256 = "0e916f6fc8f935baf858373ab63bb97b2c05299a82ac8046ab9763e23ba1e2f4",
        strip_prefix = "github.com/firefart/nonamedreturns@v1.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/firefart/nonamedreturns/com_github_firefart_nonamedreturns-v1.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/firefart/nonamedreturns/com_github_firefart_nonamedreturns-v1.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/firefart/nonamedreturns/com_github_firefart_nonamedreturns-v1.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/firefart/nonamedreturns/com_github_firefart_nonamedreturns-v1.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_flosch_pongo2_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/flosch/pongo2/v4",
        sha256 = "88e92416c43e05ab51f36bef211fcd03bb25428e2d2bebeed8a1877b8ad43281",
        strip_prefix = "github.com/flosch/pongo2/v4@v4.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/flosch/pongo2/v4/com_github_flosch_pongo2_v4-v4.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/flosch/pongo2/v4/com_github_flosch_pongo2_v4-v4.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/flosch/pongo2/v4/com_github_flosch_pongo2_v4-v4.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/flosch/pongo2/v4/com_github_flosch_pongo2_v4-v4.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_fogleman_gg",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fogleman/gg",
        sha256 = "792f7a3ea9eea31b7947dabaf9d5a307389245069078e4bf435d76cb0505439c",
        strip_prefix = "github.com/fogleman/gg@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fogleman/gg/com_github_fogleman_gg-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/fogleman/gg/com_github_fogleman_gg-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fogleman/gg/com_github_fogleman_gg-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fogleman/gg/com_github_fogleman_gg-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_frankban_quicktest",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/frankban/quicktest",
        sha256 = "35014be7acc79de33c58785d9372f48702556bf35fd89067c3ecbedf49c2e987",
        strip_prefix = "github.com/frankban/quicktest@v1.14.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/frankban/quicktest/com_github_frankban_quicktest-v1.14.3.zip",
            "http://ats.apps.svc/gomod/github.com/frankban/quicktest/com_github_frankban_quicktest-v1.14.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/frankban/quicktest/com_github_frankban_quicktest-v1.14.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/frankban/quicktest/com_github_frankban_quicktest-v1.14.3.zip",
        ],
    )
    go_repository(
        name = "com_github_fsnotify_fsnotify",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fsnotify/fsnotify",
        sha256 = "f98f08a95224f2c7a77b62aa4840cefe4970f0ff00e0a027d7e457c3df752bb2",
        strip_prefix = "github.com/fsnotify/fsnotify@v1.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fsnotify/fsnotify/com_github_fsnotify_fsnotify-v1.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/fsnotify/fsnotify/com_github_fsnotify_fsnotify-v1.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fsnotify/fsnotify/com_github_fsnotify_fsnotify-v1.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fsnotify/fsnotify/com_github_fsnotify_fsnotify-v1.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_fsouza_fake_gcs_server",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fsouza/fake-gcs-server",
        sha256 = "bd819fcc7642b82cc0f1cec60ad809208b8410d12f09fc442d16bb05eb7a7ffe",
        strip_prefix = "github.com/fsouza/fake-gcs-server@v1.44.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fsouza/fake-gcs-server/com_github_fsouza_fake_gcs_server-v1.44.0.zip",
            "http://ats.apps.svc/gomod/github.com/fsouza/fake-gcs-server/com_github_fsouza_fake_gcs_server-v1.44.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fsouza/fake-gcs-server/com_github_fsouza_fake_gcs_server-v1.44.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fsouza/fake-gcs-server/com_github_fsouza_fake_gcs_server-v1.44.0.zip",
        ],
    )
    go_repository(
        name = "com_github_fzipp_gocyclo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/fzipp/gocyclo",
        sha256 = "91d60eb91f3a309711e46d44478293a558feb9657c6a043f0b404491c8afa8c1",
        strip_prefix = "github.com/fzipp/gocyclo@v0.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/fzipp/gocyclo/com_github_fzipp_gocyclo-v0.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/fzipp/gocyclo/com_github_fzipp_gocyclo-v0.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/fzipp/gocyclo/com_github_fzipp_gocyclo-v0.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/fzipp/gocyclo/com_github_fzipp_gocyclo-v0.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gaijinentertainment_go_exhaustruct_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/GaijinEntertainment/go-exhaustruct/v3",
        sha256 = "05d3f5c0ee05460749ed615d3444c55e9b1e6eb62437951c6e21ec0ad3c62cc1",
        strip_prefix = "github.com/GaijinEntertainment/go-exhaustruct/v3@v3.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/GaijinEntertainment/go-exhaustruct/v3/com_github_gaijinentertainment_go_exhaustruct_v3-v3.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/GaijinEntertainment/go-exhaustruct/v3/com_github_gaijinentertainment_go_exhaustruct_v3-v3.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/GaijinEntertainment/go-exhaustruct/v3/com_github_gaijinentertainment_go_exhaustruct_v3-v3.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/GaijinEntertainment/go-exhaustruct/v3/com_github_gaijinentertainment_go_exhaustruct_v3-v3.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_getsentry_sentry_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/getsentry/sentry-go",
        sha256 = "679a02061b0d653713146278ee120a5fa1fefcf59a03419990673c17cbfd6e6e",
        strip_prefix = "github.com/getsentry/sentry-go@v0.27.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/getsentry/sentry-go/com_github_getsentry_sentry_go-v0.27.0.zip",
            "http://ats.apps.svc/gomod/github.com/getsentry/sentry-go/com_github_getsentry_sentry_go-v0.27.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/getsentry/sentry-go/com_github_getsentry_sentry_go-v0.27.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/getsentry/sentry-go/com_github_getsentry_sentry_go-v0.27.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ghemawat_stream",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ghemawat/stream",
        sha256 = "9c0a42cacc8e22024b58db15127886a6f8ddbcfbf89d4d062bfdc43dc40d80d5",
        strip_prefix = "github.com/ghemawat/stream@v0.0.0-20171120220530-696b145b53b9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ghemawat/stream/com_github_ghemawat_stream-v0.0.0-20171120220530-696b145b53b9.zip",
            "http://ats.apps.svc/gomod/github.com/ghemawat/stream/com_github_ghemawat_stream-v0.0.0-20171120220530-696b145b53b9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ghemawat/stream/com_github_ghemawat_stream-v0.0.0-20171120220530-696b145b53b9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ghemawat/stream/com_github_ghemawat_stream-v0.0.0-20171120220530-696b145b53b9.zip",
        ],
    )
    go_repository(
        name = "com_github_ghodss_yaml",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ghodss/yaml",
        sha256 = "c3f295d23c02c0b35e4d3b29053586e737cf9642df9615da99c0bda9bbacc624",
        strip_prefix = "github.com/ghodss/yaml@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ghodss/yaml/com_github_ghodss_yaml-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/ghodss/yaml/com_github_ghodss_yaml-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ghodss/yaml/com_github_ghodss_yaml-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ghodss/yaml/com_github_ghodss_yaml-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ghostiam_protogetter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ghostiam/protogetter",
        sha256 = "9290bd1319a4e2a52d474b902d616b2391c015ca475f4cd41f70256f9799db58",
        strip_prefix = "github.com/ghostiam/protogetter@v0.3.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ghostiam/protogetter/com_github_ghostiam_protogetter-v0.3.15.zip",
            "http://ats.apps.svc/gomod/github.com/ghostiam/protogetter/com_github_ghostiam_protogetter-v0.3.15.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ghostiam/protogetter/com_github_ghostiam_protogetter-v0.3.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ghostiam/protogetter/com_github_ghostiam_protogetter-v0.3.15.zip",
        ],
    )
    go_repository(
        name = "com_github_gin_contrib_sse",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gin-contrib/sse",
        sha256 = "512c8672f26405172077e764c4817ed8f66edc632d1bed205b5e1b8d282816ab",
        strip_prefix = "github.com/gin-contrib/sse@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gin-contrib/sse/com_github_gin_contrib_sse-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/gin-contrib/sse/com_github_gin_contrib_sse-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gin-contrib/sse/com_github_gin_contrib_sse-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gin-contrib/sse/com_github_gin_contrib_sse-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gin_gonic_gin",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gin-gonic/gin",
        sha256 = "e33746527dcef8f8fe820b49b0561c3d5bf7fd5922c25fcb9060f0e87b28c61d",
        strip_prefix = "github.com/gin-gonic/gin@v1.8.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gin-gonic/gin/com_github_gin_gonic_gin-v1.8.1.zip",
            "http://ats.apps.svc/gomod/github.com/gin-gonic/gin/com_github_gin_gonic_gin-v1.8.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gin-gonic/gin/com_github_gin_gonic_gin-v1.8.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gin-gonic/gin/com_github_gin_gonic_gin-v1.8.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_asn1_ber_asn1_ber",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-asn1-ber/asn1-ber",
        sha256 = "d0da40d84005074ccdcf352651f64f87a3525ac3bc0ff796139db9e08d1d0dd1",
        strip_prefix = "github.com/go-asn1-ber/asn1-ber@v1.5.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-asn1-ber/asn1-ber/com_github_go_asn1_ber_asn1_ber-v1.5.4.zip",
            "http://ats.apps.svc/gomod/github.com/go-asn1-ber/asn1-ber/com_github_go_asn1_ber_asn1_ber-v1.5.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-asn1-ber/asn1-ber/com_github_go_asn1_ber_asn1_ber-v1.5.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-asn1-ber/asn1-ber/com_github_go_asn1_ber_asn1_ber-v1.5.4.zip",
        ],
    )
    go_repository(
        name = "com_github_go_critic_go_critic",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-critic/go-critic",
        sha256 = "bad9c6b27bc586355d2bb360ac209db7a7f665b60d6a5d6c3c99f28d0a3388cd",
        strip_prefix = "github.com/go-critic/go-critic@v0.13.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-critic/go-critic/com_github_go_critic_go_critic-v0.13.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-critic/go-critic/com_github_go_critic_go_critic-v0.13.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-critic/go-critic/com_github_go_critic_go_critic-v0.13.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-critic/go-critic/com_github_go_critic_go_critic-v0.13.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_errors_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-errors/errors",
        sha256 = "a5c72ce072cb9532bb8652ed55508ba839e24cda1b49e1ad30187bca852272df",
        strip_prefix = "github.com/go-errors/errors@v1.4.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-errors/errors/com_github_go_errors_errors-v1.4.2.zip",
            "http://ats.apps.svc/gomod/github.com/go-errors/errors/com_github_go_errors_errors-v1.4.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-errors/errors/com_github_go_errors_errors-v1.4.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-errors/errors/com_github_go_errors_errors-v1.4.2.zip",
        ],
    )
    go_repository(
        name = "com_github_go_fonts_dejavu",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-fonts/dejavu",
        sha256 = "c2094ce49cfc24b7b7a041e54d924e311322b73a8e56db28ff179fcd403b4111",
        strip_prefix = "github.com/go-fonts/dejavu@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-fonts/dejavu/com_github_go_fonts_dejavu-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-fonts/dejavu/com_github_go_fonts_dejavu-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-fonts/dejavu/com_github_go_fonts_dejavu-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-fonts/dejavu/com_github_go_fonts_dejavu-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_fonts_latin_modern",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-fonts/latin-modern",
        sha256 = "037085a80ad108287e772d064d64bb72deb62514de84ef610506bc079f330ec0",
        strip_prefix = "github.com/go-fonts/latin-modern@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-fonts/latin-modern/com_github_go_fonts_latin_modern-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-fonts/latin-modern/com_github_go_fonts_latin_modern-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-fonts/latin-modern/com_github_go_fonts_latin_modern-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-fonts/latin-modern/com_github_go_fonts_latin_modern-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_fonts_liberation",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-fonts/liberation",
        sha256 = "bd7561251c221fe0fd8cd4c361b062a5796f6f3a1096968b8fecdd61eb82d8fe",
        strip_prefix = "github.com/go-fonts/liberation@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-fonts/liberation/com_github_go_fonts_liberation-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-fonts/liberation/com_github_go_fonts_liberation-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-fonts/liberation/com_github_go_fonts_liberation-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-fonts/liberation/com_github_go_fonts_liberation-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_fonts_stix",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-fonts/stix",
        sha256 = "51ea5a38b9fda7854af60f280dbd8b40a3e5b5a48eb00d3f8d4e43de3f514ecf",
        strip_prefix = "github.com/go-fonts/stix@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-fonts/stix/com_github_go_fonts_stix-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-fonts/stix/com_github_go_fonts_stix-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-fonts/stix/com_github_go_fonts_stix-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-fonts/stix/com_github_go_fonts_stix-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_gl_glfw",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-gl/glfw",
        sha256 = "96c694c42e7b866ea8e26dc48b612c4daa8582ce61fdeefbe92c1a4c46163169",
        strip_prefix = "github.com/go-gl/glfw@v0.0.0-20190409004039-e6da0acd62b1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-gl/glfw/com_github_go_gl_glfw-v0.0.0-20190409004039-e6da0acd62b1.zip",
            "http://ats.apps.svc/gomod/github.com/go-gl/glfw/com_github_go_gl_glfw-v0.0.0-20190409004039-e6da0acd62b1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-gl/glfw/com_github_go_gl_glfw-v0.0.0-20190409004039-e6da0acd62b1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-gl/glfw/com_github_go_gl_glfw-v0.0.0-20190409004039-e6da0acd62b1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_gl_glfw_v3_3_glfw",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-gl/glfw/v3.3/glfw",
        sha256 = "2f6a1963397cb7c3df66257a45d75fae860aa9b9eec17825d8101c1e1313da5b",
        strip_prefix = "github.com/go-gl/glfw/v3.3/glfw@v0.0.0-20200222043503-6f7a984d4dc4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-gl/glfw/v3.3/glfw/com_github_go_gl_glfw_v3_3_glfw-v0.0.0-20200222043503-6f7a984d4dc4.zip",
            "http://ats.apps.svc/gomod/github.com/go-gl/glfw/v3.3/glfw/com_github_go_gl_glfw_v3_3_glfw-v0.0.0-20200222043503-6f7a984d4dc4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-gl/glfw/v3.3/glfw/com_github_go_gl_glfw_v3_3_glfw-v0.0.0-20200222043503-6f7a984d4dc4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-gl/glfw/v3.3/glfw/com_github_go_gl_glfw_v3_3_glfw-v0.0.0-20200222043503-6f7a984d4dc4.zip",
        ],
    )
    go_repository(
        name = "com_github_go_kit_kit",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-kit/kit",
        sha256 = "2006e7fbfba4273d29042661e2c13749105ac430d85f06175359b520371e6c5a",
        strip_prefix = "github.com/go-kit/kit@v0.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-kit/kit/com_github_go_kit_kit-v0.12.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-kit/kit/com_github_go_kit_kit-v0.12.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-kit/kit/com_github_go_kit_kit-v0.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-kit/kit/com_github_go_kit_kit-v0.12.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_kit_log",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-kit/log",
        sha256 = "52634b502b9d0aa945833d93582cffc1bdd9bfa39810e7c70d0688e330b75198",
        strip_prefix = "github.com/go-kit/log@v0.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-kit/log/com_github_go_kit_log-v0.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/go-kit/log/com_github_go_kit_log-v0.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-kit/log/com_github_go_kit_log-v0.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-kit/log/com_github_go_kit_log-v0.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_latex_latex",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-latex/latex",
        sha256 = "c58be686b31679ad0a51a5d70e60df92fb4bb50a16727caa58b4a67b33f16509",
        strip_prefix = "github.com/go-latex/latex@v0.0.0-20210823091927-c0d11ff05a81",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-latex/latex/com_github_go_latex_latex-v0.0.0-20210823091927-c0d11ff05a81.zip",
            "http://ats.apps.svc/gomod/github.com/go-latex/latex/com_github_go_latex_latex-v0.0.0-20210823091927-c0d11ff05a81.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-latex/latex/com_github_go_latex_latex-v0.0.0-20210823091927-c0d11ff05a81.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-latex/latex/com_github_go_latex_latex-v0.0.0-20210823091927-c0d11ff05a81.zip",
        ],
    )
    go_repository(
        name = "com_github_go_ldap_ldap_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-ldap/ldap/v3",
        sha256 = "217e899d6fc84f70eb3a7660ee383b660c21f6315b5bc4232c8ab7b568cc0bd0",
        strip_prefix = "github.com/YangKeao/ldap/v3@v3.4.5-0.20230421065457-369a3bab1117",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/YangKeao/ldap/v3/com_github_yangkeao_ldap_v3-v3.4.5-0.20230421065457-369a3bab1117.zip",
            "http://ats.apps.svc/gomod/github.com/YangKeao/ldap/v3/com_github_yangkeao_ldap_v3-v3.4.5-0.20230421065457-369a3bab1117.zip",
            "https://cache.hawkingrei.com/gomod/github.com/YangKeao/ldap/v3/com_github_yangkeao_ldap_v3-v3.4.5-0.20230421065457-369a3bab1117.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/YangKeao/ldap/v3/com_github_yangkeao_ldap_v3-v3.4.5-0.20230421065457-369a3bab1117.zip",
        ],
    )
    go_repository(
        name = "com_github_go_logfmt_logfmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-logfmt/logfmt",
        sha256 = "a49c00cff30c02d9c09a4974ce91215bfe37f528a74f129576697869a1b8c630",
        strip_prefix = "github.com/go-logfmt/logfmt@v0.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-logfmt/logfmt/com_github_go_logfmt_logfmt-v0.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-logfmt/logfmt/com_github_go_logfmt_logfmt-v0.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-logfmt/logfmt/com_github_go_logfmt_logfmt-v0.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-logfmt/logfmt/com_github_go_logfmt_logfmt-v0.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_logr_logr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-logr/logr",
        sha256 = "27d1c8d411fd8e42dc6202991d70afa630089700f1d002de5454d6c26f93674c",
        strip_prefix = "github.com/go-logr/logr@v1.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-logr/logr/com_github_go_logr_logr-v1.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/go-logr/logr/com_github_go_logr_logr-v1.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-logr/logr/com_github_go_logr_logr-v1.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-logr/logr/com_github_go_logr_logr-v1.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_logr_stdr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-logr/stdr",
        sha256 = "9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef",
        strip_prefix = "github.com/go-logr/stdr@v1.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-logr/stdr/com_github_go_logr_stdr-v1.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/go-logr/stdr/com_github_go_logr_stdr-v1.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-logr/stdr/com_github_go_logr_stdr-v1.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-logr/stdr/com_github_go_logr_stdr-v1.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_go_martini_martini",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-martini/martini",
        sha256 = "0561a4dadd68dbc1b38c09ed95bbfc5073b0a7708b9a787d38533ebd48040ec2",
        strip_prefix = "github.com/go-martini/martini@v0.0.0-20170121215854-22fa46961aab",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-martini/martini/com_github_go_martini_martini-v0.0.0-20170121215854-22fa46961aab.zip",
            "http://ats.apps.svc/gomod/github.com/go-martini/martini/com_github_go_martini_martini-v0.0.0-20170121215854-22fa46961aab.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-martini/martini/com_github_go_martini_martini-v0.0.0-20170121215854-22fa46961aab.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-martini/martini/com_github_go_martini_martini-v0.0.0-20170121215854-22fa46961aab.zip",
        ],
    )
    go_repository(
        name = "com_github_go_ole_go_ole",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-ole/go-ole",
        sha256 = "bbf5b3bfa227a5daa06eb16ecdecccc0b20e08749bf103afb523fd72764e727a",
        strip_prefix = "github.com/go-ole/go-ole@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-ole/go-ole/com_github_go_ole_go_ole-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-ole/go-ole/com_github_go_ole_go_ole-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-ole/go-ole/com_github_go_ole_go_ole-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-ole/go-ole/com_github_go_ole_go_ole-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_analysis",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/analysis",
        sha256 = "c38edc10742e5592847d0608ba13b1372a4a7ce1309fc521ea58842a0eb99d16",
        strip_prefix = "github.com/go-openapi/analysis@v0.21.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/analysis/com_github_go_openapi_analysis-v0.21.4.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/analysis/com_github_go_openapi_analysis-v0.21.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/analysis/com_github_go_openapi_analysis-v0.21.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/analysis/com_github_go_openapi_analysis-v0.21.4.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/errors",
        sha256 = "fd36596bb434cedffc79748a261193cf1938c19b05afa9e56e65f8b643561fee",
        strip_prefix = "github.com/go-openapi/errors@v0.21.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/errors/com_github_go_openapi_errors-v0.21.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/errors/com_github_go_openapi_errors-v0.21.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/errors/com_github_go_openapi_errors-v0.21.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/errors/com_github_go_openapi_errors-v0.21.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_jsonpointer",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/jsonpointer",
        sha256 = "ff51a1ccbf148289e755c55f756fde4aa9626d5b6a79065f7592be868fc0ed74",
        strip_prefix = "github.com/go-openapi/jsonpointer@v0.20.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/jsonpointer/com_github_go_openapi_jsonpointer-v0.20.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/jsonpointer/com_github_go_openapi_jsonpointer-v0.20.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/jsonpointer/com_github_go_openapi_jsonpointer-v0.20.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/jsonpointer/com_github_go_openapi_jsonpointer-v0.20.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_jsonreference",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/jsonreference",
        sha256 = "27afd0bef56453e463eba6093afb04dc08d97b5ad0e15b2266cac867d062ae1b",
        strip_prefix = "github.com/go-openapi/jsonreference@v0.20.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/jsonreference/com_github_go_openapi_jsonreference-v0.20.2.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/jsonreference/com_github_go_openapi_jsonreference-v0.20.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/jsonreference/com_github_go_openapi_jsonreference-v0.20.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/jsonreference/com_github_go_openapi_jsonreference-v0.20.2.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_loads",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/loads",
        sha256 = "a97ae476c31ad269ad3429186fab2fe08f38eeb5d4167215004194b19da9d1de",
        strip_prefix = "github.com/go-openapi/loads@v0.21.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/loads/com_github_go_openapi_loads-v0.21.2.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/loads/com_github_go_openapi_loads-v0.21.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/loads/com_github_go_openapi_loads-v0.21.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/loads/com_github_go_openapi_loads-v0.21.2.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_spec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/spec",
        sha256 = "06c843a4617b262b06f232c6fa380e732dea80cf77b9a80a09c0d1c83a0a8665",
        strip_prefix = "github.com/go-openapi/spec@v0.20.9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/spec/com_github_go_openapi_spec-v0.20.9.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/spec/com_github_go_openapi_spec-v0.20.9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/spec/com_github_go_openapi_spec-v0.20.9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/spec/com_github_go_openapi_spec-v0.20.9.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_strfmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/strfmt",
        sha256 = "37f512d6ac447bc026276a87eeb89d3c0ec243740c69e79743f8d9761d29aafe",
        strip_prefix = "github.com/go-openapi/strfmt@v0.22.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/strfmt/com_github_go_openapi_strfmt-v0.22.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/strfmt/com_github_go_openapi_strfmt-v0.22.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/strfmt/com_github_go_openapi_strfmt-v0.22.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/strfmt/com_github_go_openapi_strfmt-v0.22.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_swag",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/swag",
        sha256 = "ce8e7f82205e5c1949c99710f7d74be65d9a1353f38afe85338e9e4ba5981cb9",
        strip_prefix = "github.com/go-openapi/swag@v0.22.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/swag/com_github_go_openapi_swag-v0.22.4.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/swag/com_github_go_openapi_swag-v0.22.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/swag/com_github_go_openapi_swag-v0.22.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/swag/com_github_go_openapi_swag-v0.22.4.zip",
        ],
    )
    go_repository(
        name = "com_github_go_openapi_validate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-openapi/validate",
        sha256 = "7d528b3b728df6a721977532d838cec9a6699baf49959e195aa775e32909d0b2",
        strip_prefix = "github.com/go-openapi/validate@v0.22.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-openapi/validate/com_github_go_openapi_validate-v0.22.1.zip",
            "http://ats.apps.svc/gomod/github.com/go-openapi/validate/com_github_go_openapi_validate-v0.22.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-openapi/validate/com_github_go_openapi_validate-v0.22.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-openapi/validate/com_github_go_openapi_validate-v0.22.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_pdf_fpdf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-pdf/fpdf",
        sha256 = "03a6909fc346ac972b008b77585ac3954d76b416c33b4b64dc22c5f35f0e1edb",
        strip_prefix = "github.com/go-pdf/fpdf@v0.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-pdf/fpdf/com_github_go_pdf_fpdf-v0.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-pdf/fpdf/com_github_go_pdf_fpdf-v0.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-pdf/fpdf/com_github_go_pdf_fpdf-v0.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-pdf/fpdf/com_github_go_pdf_fpdf-v0.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_playground_locales",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-playground/locales",
        sha256 = "e103ae2c635cde62d2b75ff021be20443ab8d227aebfed5f043846575ea1fa43",
        strip_prefix = "github.com/go-playground/locales@v0.14.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-playground/locales/com_github_go_playground_locales-v0.14.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-playground/locales/com_github_go_playground_locales-v0.14.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-playground/locales/com_github_go_playground_locales-v0.14.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-playground/locales/com_github_go_playground_locales-v0.14.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_playground_universal_translator",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-playground/universal-translator",
        sha256 = "15f3241347dfcfe7d668595727629bcf54ff028ebc4b7c955b9c2bdeb253a110",
        strip_prefix = "github.com/go-playground/universal-translator@v0.18.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-playground/universal-translator/com_github_go_playground_universal_translator-v0.18.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-playground/universal-translator/com_github_go_playground_universal_translator-v0.18.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-playground/universal-translator/com_github_go_playground_universal_translator-v0.18.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-playground/universal-translator/com_github_go_playground_universal_translator-v0.18.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_playground_validator_v10",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-playground/validator/v10",
        sha256 = "d10a0eb03b84570af1f1278f8df82cee6c5dcddfe2e23d6f2c5bc018a2d3929e",
        strip_prefix = "github.com/go-playground/validator/v10@v10.11.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-playground/validator/v10/com_github_go_playground_validator_v10-v10.11.1.zip",
            "http://ats.apps.svc/gomod/github.com/go-playground/validator/v10/com_github_go_playground_validator_v10-v10.11.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-playground/validator/v10/com_github_go_playground_validator_v10-v10.11.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-playground/validator/v10/com_github_go_playground_validator_v10-v10.11.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_resty_resty_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-resty/resty/v2",
        sha256 = "9e6212c6a90936edadf04754df8dfa1b0b154e013bdbf75f94a105d9fa54165e",
        strip_prefix = "github.com/go-resty/resty/v2@v2.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-resty/resty/v2/com_github_go_resty_resty_v2-v2.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-resty/resty/v2/com_github_go_resty_resty_v2-v2.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-resty/resty/v2/com_github_go_resty_resty_v2-v2.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-resty/resty/v2/com_github_go_resty_resty_v2-v2.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_sql_driver_mysql",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-sql-driver/mysql",
        sha256 = "5d3436cafe5d147d1f56cca6917f155b0e337b7d5df9f2f8b8be33584a7b1e2d",
        strip_prefix = "github.com/go-sql-driver/mysql@v1.7.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-sql-driver/mysql/com_github_go_sql_driver_mysql-v1.7.1.zip",
            "http://ats.apps.svc/gomod/github.com/go-sql-driver/mysql/com_github_go_sql_driver_mysql-v1.7.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-sql-driver/mysql/com_github_go_sql_driver_mysql-v1.7.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-sql-driver/mysql/com_github_go_sql_driver_mysql-v1.7.1.zip",
        ],
    )
    go_repository(
        name = "com_github_go_stack_stack",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-stack/stack",
        sha256 = "78c2667c710f811307038634ffa43af442619acfeaf1efb593aa4e0ded9df48f",
        strip_prefix = "github.com/go-stack/stack@v1.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-stack/stack/com_github_go_stack_stack-v1.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-stack/stack/com_github_go_stack_stack-v1.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-stack/stack/com_github_go_stack_stack-v1.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-stack/stack/com_github_go_stack_stack-v1.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_task_slim_sprig",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-task/slim-sprig",
        sha256 = "25a036dc8eb9f6227c2df818916f76db93eebbac88cc24bad5c960b0c60d7a08",
        strip_prefix = "github.com/go-task/slim-sprig@v0.0.0-20230315185526-52ccab3ef572",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-task/slim-sprig/com_github_go_task_slim_sprig-v0.0.0-20230315185526-52ccab3ef572.zip",
            "http://ats.apps.svc/gomod/github.com/go-task/slim-sprig/com_github_go_task_slim_sprig-v0.0.0-20230315185526-52ccab3ef572.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-task/slim-sprig/com_github_go_task_slim_sprig-v0.0.0-20230315185526-52ccab3ef572.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-task/slim-sprig/com_github_go_task_slim_sprig-v0.0.0-20230315185526-52ccab3ef572.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_astcast",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/astcast",
        sha256 = "c02cc24bf79fccc19edf826aff57a2f3c4db66abe9901345175abd46689b643a",
        strip_prefix = "github.com/go-toolsmith/astcast@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/astcast/com_github_go_toolsmith_astcast-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/astcast/com_github_go_toolsmith_astcast-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/astcast/com_github_go_toolsmith_astcast-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/astcast/com_github_go_toolsmith_astcast-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_astcopy",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/astcopy",
        sha256 = "941006b1e498d59d593f74ba2bf2f58f5aafc2dc29fba4e0b803394b6098b7eb",
        strip_prefix = "github.com/go-toolsmith/astcopy@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/astcopy/com_github_go_toolsmith_astcopy-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/astcopy/com_github_go_toolsmith_astcopy-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/astcopy/com_github_go_toolsmith_astcopy-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/astcopy/com_github_go_toolsmith_astcopy-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_astequal",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/astequal",
        sha256 = "9f646c10df79d73af47c98b7eca0f44ee3f49ec6da71597b2e4630114a11d59e",
        strip_prefix = "github.com/go-toolsmith/astequal@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/astequal/com_github_go_toolsmith_astequal-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/astequal/com_github_go_toolsmith_astequal-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/astequal/com_github_go_toolsmith_astequal-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/astequal/com_github_go_toolsmith_astequal-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_astfmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/astfmt",
        sha256 = "6e21f3ed75bba0460be9448e575ac342b75b128dbd273e568252780f18608b60",
        strip_prefix = "github.com/go-toolsmith/astfmt@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/astfmt/com_github_go_toolsmith_astfmt-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/astfmt/com_github_go_toolsmith_astfmt-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/astfmt/com_github_go_toolsmith_astfmt-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/astfmt/com_github_go_toolsmith_astfmt-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_astp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/astp",
        sha256 = "e594ad39bd1a4235cef8bfc6c7c530707c4b366cc667ed0af76e397ce89689d7",
        strip_prefix = "github.com/go-toolsmith/astp@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/astp/com_github_go_toolsmith_astp-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/astp/com_github_go_toolsmith_astp-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/astp/com_github_go_toolsmith_astp-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/astp/com_github_go_toolsmith_astp-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_strparse",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/strparse",
        sha256 = "4d1b8d6b53b0595942cbd7f49f33690e7d673785d151d8aade02d9baa5e5cd6a",
        strip_prefix = "github.com/go-toolsmith/strparse@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/strparse/com_github_go_toolsmith_strparse-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/strparse/com_github_go_toolsmith_strparse-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/strparse/com_github_go_toolsmith_strparse-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/strparse/com_github_go_toolsmith_strparse-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_toolsmith_typep",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-toolsmith/typep",
        sha256 = "48a1c09f9968b29b0d62029988db0a242869df138553c5d9235f61d51d80ba48",
        strip_prefix = "github.com/go-toolsmith/typep@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-toolsmith/typep/com_github_go_toolsmith_typep-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-toolsmith/typep/com_github_go_toolsmith_typep-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-toolsmith/typep/com_github_go_toolsmith_typep-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-toolsmith/typep/com_github_go_toolsmith_typep-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_viper_mapstructure_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-viper/mapstructure/v2",
        sha256 = "33e0398e34eca4b1b8c9d91318dd3be871811aee6e2ababc82c02280dcca296a",
        strip_prefix = "github.com/go-viper/mapstructure/v2@v2.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-viper/mapstructure/v2/com_github_go_viper_mapstructure_v2-v2.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/go-viper/mapstructure/v2/com_github_go_viper_mapstructure_v2-v2.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-viper/mapstructure/v2/com_github_go_viper_mapstructure_v2-v2.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-viper/mapstructure/v2/com_github_go_viper_mapstructure_v2-v2.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_go_xmlfmt_xmlfmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-xmlfmt/xmlfmt",
        sha256 = "ad94f4b616d5f54ae7b012a5a7a3fc925aa8c7e8e2e3e0e0ef3ef2faf2368a9f",
        strip_prefix = "github.com/go-xmlfmt/xmlfmt@v1.1.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-xmlfmt/xmlfmt/com_github_go_xmlfmt_xmlfmt-v1.1.3.zip",
            "http://ats.apps.svc/gomod/github.com/go-xmlfmt/xmlfmt/com_github_go_xmlfmt_xmlfmt-v1.1.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-xmlfmt/xmlfmt/com_github_go_xmlfmt_xmlfmt-v1.1.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-xmlfmt/xmlfmt/com_github_go_xmlfmt_xmlfmt-v1.1.3.zip",
        ],
    )
    go_repository(
        name = "com_github_go_zookeeper_zk",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/go-zookeeper/zk",
        sha256 = "5577b9e7924ff73c19e2c62fb6fddb9621d05f0720d0994ce8dc4be625399ca3",
        strip_prefix = "github.com/go-zookeeper/zk@v1.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/go-zookeeper/zk/com_github_go_zookeeper_zk-v1.0.3.zip",
            "http://ats.apps.svc/gomod/github.com/go-zookeeper/zk/com_github_go_zookeeper_zk-v1.0.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/go-zookeeper/zk/com_github_go_zookeeper_zk-v1.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/go-zookeeper/zk/com_github_go_zookeeper_zk-v1.0.3.zip",
        ],
    )
    go_repository(
        name = "com_github_gobwas_glob",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gobwas/glob",
        sha256 = "0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf",
        strip_prefix = "github.com/gobwas/glob@v0.2.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gobwas/glob/com_github_gobwas_glob-v0.2.3.zip",
            "http://ats.apps.svc/gomod/github.com/gobwas/glob/com_github_gobwas_glob-v0.2.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gobwas/glob/com_github_gobwas_glob-v0.2.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gobwas/glob/com_github_gobwas_glob-v0.2.3.zip",
        ],
    )
    go_repository(
        name = "com_github_goccy_go_json",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/goccy/go-json",
        sha256 = "ed9043ee01cc46557c74bcecc625db37ffe3a5c7af219f390a287f44a40c2520",
        strip_prefix = "github.com/goccy/go-json@v0.10.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/goccy/go-json/com_github_goccy_go_json-v0.10.2.zip",
            "http://ats.apps.svc/gomod/github.com/goccy/go-json/com_github_goccy_go_json-v0.10.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/goccy/go-json/com_github_goccy_go_json-v0.10.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/goccy/go-json/com_github_goccy_go_json-v0.10.2.zip",
        ],
    )
    go_repository(
        name = "com_github_goccy_go_reflect",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/goccy/go-reflect",
        sha256 = "d5d5b55be60c40d1ecfbd13a7e89c3fb5363e8b7cd07e2827f7e987944c41458",
        strip_prefix = "github.com/goccy/go-reflect@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/goccy/go-reflect/com_github_goccy_go_reflect-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/goccy/go-reflect/com_github_goccy_go_reflect-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/goccy/go-reflect/com_github_goccy_go_reflect-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/goccy/go-reflect/com_github_goccy_go_reflect-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_godbus_dbus_v5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/godbus/dbus/v5",
        sha256 = "23a23f08bea48e6e49a46a4015b64adbb1692dc6ddf0d83c2f0c2027cb8e31c8",
        strip_prefix = "github.com/godbus/dbus/v5@v5.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/godbus/dbus/v5/com_github_godbus_dbus_v5-v5.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/godbus/dbus/v5/com_github_godbus_dbus_v5-v5.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/godbus/dbus/v5/com_github_godbus_dbus_v5-v5.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/godbus/dbus/v5/com_github_godbus_dbus_v5-v5.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_gofrs_flock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gofrs/flock",
        sha256 = "fe8242a48c3109148d988433301bd8ab3cd1d0430a21af07e601f9b0671923e8",
        strip_prefix = "github.com/gofrs/flock@v0.12.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gofrs/flock/com_github_gofrs_flock-v0.12.1.zip",
            "http://ats.apps.svc/gomod/github.com/gofrs/flock/com_github_gofrs_flock-v0.12.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gofrs/flock/com_github_gofrs_flock-v0.12.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gofrs/flock/com_github_gofrs_flock-v0.12.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gogo_googleapis",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gogo/googleapis",
        sha256 = "34110f4fe52daa66bf190e6c5be70e2e384ceca3cb1bce3e20f32994ede5a141",
        strip_prefix = "github.com/gogo/googleapis@v1.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gogo/googleapis/com_github_gogo_googleapis-v1.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/gogo/googleapis/com_github_gogo_googleapis-v1.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gogo/googleapis/com_github_gogo_googleapis-v1.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gogo/googleapis/com_github_gogo_googleapis-v1.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gogo_protobuf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gogo/protobuf",
        sha256 = "dd2b73f163c8183941626360196c8f844addd95423d341a0412e1b22d0104ff7",
        strip_prefix = "github.com/gogo/protobuf@v1.3.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gogo/protobuf/com_github_gogo_protobuf-v1.3.2.zip",
            "http://ats.apps.svc/gomod/github.com/gogo/protobuf/com_github_gogo_protobuf-v1.3.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gogo/protobuf/com_github_gogo_protobuf-v1.3.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gogo/protobuf/com_github_gogo_protobuf-v1.3.2.zip",
        ],
    )
    go_repository(
        name = "com_github_gogo_status",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gogo/status",
        sha256 = "c042d3555c9f490a75d44ad4c3dff367f9512e6d189252f8765f4837b11b12b1",
        strip_prefix = "github.com/gogo/status@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gogo/status/com_github_gogo_status-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/gogo/status/com_github_gogo_status-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gogo/status/com_github_gogo_status-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gogo/status/com_github_gogo_status-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_goji_httpauth",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/goji/httpauth",
        sha256 = "8467ed1df8ffba8da7ead144b656b6281469ab4d122adf3edf496175ad870192",
        strip_prefix = "github.com/goji/httpauth@v0.0.0-20160601135302-2da839ab0f4d",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/goji/httpauth/com_github_goji_httpauth-v0.0.0-20160601135302-2da839ab0f4d.zip",
            "http://ats.apps.svc/gomod/github.com/goji/httpauth/com_github_goji_httpauth-v0.0.0-20160601135302-2da839ab0f4d.zip",
            "https://cache.hawkingrei.com/gomod/github.com/goji/httpauth/com_github_goji_httpauth-v0.0.0-20160601135302-2da839ab0f4d.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/goji/httpauth/com_github_goji_httpauth-v0.0.0-20160601135302-2da839ab0f4d.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_freetype",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/freetype",
        sha256 = "cdcb9e6a14933dcbf167b44dcd5083fc6a2e52c4fae8fb79747c691efeb7d84e",
        strip_prefix = "github.com/golang/freetype@v0.0.0-20170609003504-e2365dfdc4a0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/freetype/com_github_golang_freetype-v0.0.0-20170609003504-e2365dfdc4a0.zip",
            "http://ats.apps.svc/gomod/github.com/golang/freetype/com_github_golang_freetype-v0.0.0-20170609003504-e2365dfdc4a0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/freetype/com_github_golang_freetype-v0.0.0-20170609003504-e2365dfdc4a0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/freetype/com_github_golang_freetype-v0.0.0-20170609003504-e2365dfdc4a0.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_glog",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/glog",
        sha256 = "6636c4a48a010844df02886621c32706af2f5e707ad23acb52fe22510b60c822",
        strip_prefix = "github.com/golang/glog@v1.2.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/glog/com_github_golang_glog-v1.2.4.zip",
            "http://ats.apps.svc/gomod/github.com/golang/glog/com_github_golang_glog-v1.2.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/glog/com_github_golang_glog-v1.2.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/glog/com_github_golang_glog-v1.2.4.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_groupcache",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/groupcache",
        sha256 = "b27034e8fc013627543e1ad098cfc65329f2896df3da5cf3266cc9166f93f3a5",
        strip_prefix = "github.com/golang/groupcache@v0.0.0-20210331224755-41bb18bfe9da",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/groupcache/com_github_golang_groupcache-v0.0.0-20210331224755-41bb18bfe9da.zip",
            "http://ats.apps.svc/gomod/github.com/golang/groupcache/com_github_golang_groupcache-v0.0.0-20210331224755-41bb18bfe9da.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/groupcache/com_github_golang_groupcache-v0.0.0-20210331224755-41bb18bfe9da.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/groupcache/com_github_golang_groupcache-v0.0.0-20210331224755-41bb18bfe9da.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_jwt_jwt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang-jwt/jwt",
        sha256 = "1fedba05e152177f8de04cafe8d30200b03e657f70ac667b2fa8e04fb3d9109d",
        strip_prefix = "github.com/golang-jwt/jwt@v3.2.1+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang-jwt/jwt/com_github_golang_jwt_jwt-v3.2.1+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/golang-jwt/jwt/com_github_golang_jwt_jwt-v3.2.1+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang-jwt/jwt/com_github_golang_jwt_jwt-v3.2.1+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang-jwt/jwt/com_github_golang_jwt_jwt-v3.2.1+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_jwt_jwt_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang-jwt/jwt/v4",
        sha256 = "ec5ee69a31fd478fc197fddce7c06dad1abe7543095a55c4ee6546ae79d99a0f",
        strip_prefix = "github.com/golang-jwt/jwt/v4@v4.5.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang-jwt/jwt/v4/com_github_golang_jwt_jwt_v4-v4.5.2.zip",
            "http://ats.apps.svc/gomod/github.com/golang-jwt/jwt/v4/com_github_golang_jwt_jwt_v4-v4.5.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang-jwt/jwt/v4/com_github_golang_jwt_jwt_v4-v4.5.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang-jwt/jwt/v4/com_github_golang_jwt_jwt_v4-v4.5.2.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_jwt_jwt_v5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang-jwt/jwt/v5",
        sha256 = "278980d9e52498b7c54baf21fed203b942aa1d08b7f62eec494110b61b6fd3c9",
        strip_prefix = "github.com/golang-jwt/jwt/v5@v5.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang-jwt/jwt/v5/com_github_golang_jwt_jwt_v5-v5.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/golang-jwt/jwt/v5/com_github_golang_jwt_jwt_v5-v5.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang-jwt/jwt/v5/com_github_golang_jwt_jwt_v5-v5.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang-jwt/jwt/v5/com_github_golang_jwt_jwt_v5-v5.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_mock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/mock",
        sha256 = "fa25916b546f90da49418f436e3a61e4c5dae898cf3c82b0007b5a6fab74261b",
        strip_prefix = "github.com/golang/mock@v1.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/mock/com_github_golang_mock-v1.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/golang/mock/com_github_golang_mock-v1.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/mock/com_github_golang_mock-v1.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/mock/com_github_golang_mock-v1.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_protobuf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/protobuf",
        sha256 = "9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b",
        strip_prefix = "github.com/golang/protobuf@v1.5.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/protobuf/com_github_golang_protobuf-v1.5.4.zip",
            "http://ats.apps.svc/gomod/github.com/golang/protobuf/com_github_golang_protobuf-v1.5.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/protobuf/com_github_golang_protobuf-v1.5.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/protobuf/com_github_golang_protobuf-v1.5.4.zip",
        ],
    )
    go_repository(
        name = "com_github_golang_snappy",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golang/snappy",
        sha256 = "ea4545ca44ee990554094df6de440386a440a5bd99106e048939409d63beb423",
        strip_prefix = "github.com/golang/snappy@v0.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golang/snappy/com_github_golang_snappy-v0.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/golang/snappy/com_github_golang_snappy-v0.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golang/snappy/com_github_golang_snappy-v0.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golang/snappy/com_github_golang_snappy-v0.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_dupl",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/dupl",
        sha256 = "ef0bbd65708ff62bef98a1b0f3ebb7ec684872f567f16f29d2ce7f6985d474e5",
        strip_prefix = "github.com/golangci/dupl@v0.0.0-20250308024227-f665c8d69b32",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/dupl/com_github_golangci_dupl-v0.0.0-20250308024227-f665c8d69b32.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/dupl/com_github_golangci_dupl-v0.0.0-20250308024227-f665c8d69b32.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/dupl/com_github_golangci_dupl-v0.0.0-20250308024227-f665c8d69b32.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/dupl/com_github_golangci_dupl-v0.0.0-20250308024227-f665c8d69b32.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_go_printf_func_name",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/go-printf-func-name",
        sha256 = "7f882087769b5ed4650a7cc71f085aa8e5fc5a8bbe6481b73eb7853d3ced7e7b",
        strip_prefix = "github.com/golangci/go-printf-func-name@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/go-printf-func-name/com_github_golangci_go_printf_func_name-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/go-printf-func-name/com_github_golangci_go_printf_func_name-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/go-printf-func-name/com_github_golangci_go_printf_func_name-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/go-printf-func-name/com_github_golangci_go_printf_func_name-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_gofmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/gofmt",
        sha256 = "7646cde79c36b3bd89e63e9fe7ec6bd500754e809baaad51369d75fbec9f28a9",
        strip_prefix = "github.com/golangci/gofmt@v0.0.0-20250106114630-d62b90e6713d",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/gofmt/com_github_golangci_gofmt-v0.0.0-20250106114630-d62b90e6713d.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/gofmt/com_github_golangci_gofmt-v0.0.0-20250106114630-d62b90e6713d.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/gofmt/com_github_golangci_gofmt-v0.0.0-20250106114630-d62b90e6713d.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/gofmt/com_github_golangci_gofmt-v0.0.0-20250106114630-d62b90e6713d.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_golangci_lint_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/golangci-lint/v2",
        sha256 = "0e088d503fad994e1dd8883e6e3ea3dc2c8132ba326e7f1eb0fced5cf0effd0d",
        strip_prefix = "github.com/golangci/golangci-lint/v2@v2.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/golangci-lint/v2/com_github_golangci_golangci_lint_v2-v2.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/golangci-lint/v2/com_github_golangci_golangci_lint_v2-v2.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/golangci-lint/v2/com_github_golangci_golangci_lint_v2-v2.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/golangci-lint/v2/com_github_golangci_golangci_lint_v2-v2.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_golines",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/golines",
        sha256 = "c7e60a838fb510d9053cd1d61552e3ae965de6a70d3f0f6a2c2dff88d5c8b0f0",
        strip_prefix = "github.com/golangci/golines@v0.0.0-20250217134842-442fd0091d95",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/golines/com_github_golangci_golines-v0.0.0-20250217134842-442fd0091d95.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/golines/com_github_golangci_golines-v0.0.0-20250217134842-442fd0091d95.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/golines/com_github_golangci_golines-v0.0.0-20250217134842-442fd0091d95.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/golines/com_github_golangci_golines-v0.0.0-20250217134842-442fd0091d95.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_gosec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/gosec",
        sha256 = "04e556925885db7957b6429bc90361bd0d3d82bcc64eb1de88c4bb07375fa161",
        strip_prefix = "github.com/golangci/gosec@v0.0.0-20180901114220-8afd9cbb6cfb",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/gosec/com_github_golangci_gosec-v0.0.0-20180901114220-8afd9cbb6cfb.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/gosec/com_github_golangci_gosec-v0.0.0-20180901114220-8afd9cbb6cfb.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/gosec/com_github_golangci_gosec-v0.0.0-20180901114220-8afd9cbb6cfb.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/gosec/com_github_golangci_gosec-v0.0.0-20180901114220-8afd9cbb6cfb.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_misspell",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/misspell",
        sha256 = "a673d2f7f3e922b1ed72edc0e4219ab172f4fe1b256772ab0a70bc0fcd1ea8d5",
        strip_prefix = "github.com/golangci/misspell@v0.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/misspell/com_github_golangci_misspell-v0.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/misspell/com_github_golangci_misspell-v0.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/misspell/com_github_golangci_misspell-v0.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/misspell/com_github_golangci_misspell-v0.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_modinfo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/modinfo",
        sha256 = "6aea19260e77204bc573b4e9f362e616e27a8caef4afbf7e22ada544037009aa",
        strip_prefix = "github.com/golangci/modinfo@v0.3.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/modinfo/com_github_golangci_modinfo-v0.3.3.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/modinfo/com_github_golangci_modinfo-v0.3.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/modinfo/com_github_golangci_modinfo-v0.3.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/modinfo/com_github_golangci_modinfo-v0.3.3.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_plugin_module_register",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/plugin-module-register",
        sha256 = "f24a713c83a372489b7d2e3a4bb2c76714029af0aea623989e4b205fda9090b6",
        strip_prefix = "github.com/golangci/plugin-module-register@v0.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/plugin-module-register/com_github_golangci_plugin_module_register-v0.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/plugin-module-register/com_github_golangci_plugin_module_register-v0.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/plugin-module-register/com_github_golangci_plugin_module_register-v0.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/plugin-module-register/com_github_golangci_plugin_module_register-v0.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_prealloc",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/prealloc",
        sha256 = "f2e1ea148d92af46aa61dbb777aa525a9792575a3282fd37af6b5d380dd5bca8",
        strip_prefix = "github.com/golangci/prealloc@v0.0.0-20180630174525-215b22d4de21",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/prealloc/com_github_golangci_prealloc-v0.0.0-20180630174525-215b22d4de21.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/prealloc/com_github_golangci_prealloc-v0.0.0-20180630174525-215b22d4de21.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/prealloc/com_github_golangci_prealloc-v0.0.0-20180630174525-215b22d4de21.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/prealloc/com_github_golangci_prealloc-v0.0.0-20180630174525-215b22d4de21.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_revgrep",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/revgrep",
        sha256 = "334c2344d6e19956e246653dfcbd7448c9ce05065d2ffae78172edc7eaa91f9c",
        strip_prefix = "github.com/golangci/revgrep@v0.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/revgrep/com_github_golangci_revgrep-v0.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/revgrep/com_github_golangci_revgrep-v0.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/revgrep/com_github_golangci_revgrep-v0.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/revgrep/com_github_golangci_revgrep-v0.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_swaggoswag",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/swaggoswag",
        sha256 = "afa98187f481942dc09020aa3c7b6cc908794221957a8b831bb704135b5835f8",
        strip_prefix = "github.com/golangci/swaggoswag@v0.0.0-20250504205917-77f2aca3143e",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/swaggoswag/com_github_golangci_swaggoswag-v0.0.0-20250504205917-77f2aca3143e.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/swaggoswag/com_github_golangci_swaggoswag-v0.0.0-20250504205917-77f2aca3143e.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/swaggoswag/com_github_golangci_swaggoswag-v0.0.0-20250504205917-77f2aca3143e.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/swaggoswag/com_github_golangci_swaggoswag-v0.0.0-20250504205917-77f2aca3143e.zip",
        ],
    )
    go_repository(
        name = "com_github_golangci_unconvert",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/golangci/unconvert",
        sha256 = "be0de35cdb14bbac346669ff06274f24ee59209c88c11b65214dc5324de2de67",
        strip_prefix = "github.com/golangci/unconvert@v0.0.0-20250410112200-a129a6e6413e",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/golangci/unconvert/com_github_golangci_unconvert-v0.0.0-20250410112200-a129a6e6413e.zip",
            "http://ats.apps.svc/gomod/github.com/golangci/unconvert/com_github_golangci_unconvert-v0.0.0-20250410112200-a129a6e6413e.zip",
            "https://cache.hawkingrei.com/gomod/github.com/golangci/unconvert/com_github_golangci_unconvert-v0.0.0-20250410112200-a129a6e6413e.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/golangci/unconvert/com_github_golangci_unconvert-v0.0.0-20250410112200-a129a6e6413e.zip",
        ],
    )
    go_repository(
        name = "com_github_google_btree",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/btree",
        sha256 = "faee8550c5fffb4ae1dadde5ccaccb13298726f9fad226bb4eed0c03c90a481d",
        strip_prefix = "github.com/google/btree@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/btree/com_github_google_btree-v1.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/google/btree/com_github_google_btree-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/btree/com_github_google_btree-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/btree/com_github_google_btree-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_google_flatbuffers",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/flatbuffers",
        sha256 = "0c0a4aab1c6029141d655bc7fdc07e22dd06f3f64ebbf7a2250b870ef7aac7ee",
        strip_prefix = "github.com/google/flatbuffers@v2.0.8+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/flatbuffers/com_github_google_flatbuffers-v2.0.8+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/google/flatbuffers/com_github_google_flatbuffers-v2.0.8+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/flatbuffers/com_github_google_flatbuffers-v2.0.8+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/flatbuffers/com_github_google_flatbuffers-v2.0.8+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_google_gnostic_models",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/gnostic-models",
        sha256 = "5276180bd184f64676867fc2f64a583175968c507d404be6b7f1261ead229484",
        strip_prefix = "github.com/google/gnostic-models@v0.6.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/gnostic-models/com_github_google_gnostic_models-v0.6.8.zip",
            "http://ats.apps.svc/gomod/github.com/google/gnostic-models/com_github_google_gnostic_models-v0.6.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/gnostic-models/com_github_google_gnostic_models-v0.6.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/gnostic-models/com_github_google_gnostic_models-v0.6.8.zip",
        ],
    )
    go_repository(
        name = "com_github_google_go_cmp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/go-cmp",
        sha256 = "64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539",
        strip_prefix = "github.com/google/go-cmp@v0.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/go-cmp/com_github_google_go_cmp-v0.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/go-cmp/com_github_google_go_cmp-v0.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/go-cmp/com_github_google_go_cmp-v0.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/go-cmp/com_github_google_go_cmp-v0.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_go_github_v33",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/go-github/v33",
        sha256 = "16649a598ad8c271509c5967778ea322eb3d5046d68f0ff770b326786e77f4bc",
        strip_prefix = "github.com/google/go-github/v33@v33.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/go-github/v33/com_github_google_go_github_v33-v33.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/go-github/v33/com_github_google_go_github_v33-v33.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/go-github/v33/com_github_google_go_github_v33-v33.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/go-github/v33/com_github_google_go_github_v33-v33.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_go_pkcs11",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/go-pkcs11",
        sha256 = "b9bf12c2450efa77c8b27134d5f206633057fcf0c324883797d7fde5bc3a4887",
        strip_prefix = "github.com/google/go-pkcs11@v0.2.1-0.20230907215043-c6f79328ddf9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/go-pkcs11/com_github_google_go_pkcs11-v0.2.1-0.20230907215043-c6f79328ddf9.zip",
            "http://ats.apps.svc/gomod/github.com/google/go-pkcs11/com_github_google_go_pkcs11-v0.2.1-0.20230907215043-c6f79328ddf9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/go-pkcs11/com_github_google_go_pkcs11-v0.2.1-0.20230907215043-c6f79328ddf9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/go-pkcs11/com_github_google_go_pkcs11-v0.2.1-0.20230907215043-c6f79328ddf9.zip",
        ],
    )
    go_repository(
        name = "com_github_google_go_querystring",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/go-querystring",
        sha256 = "a6aafc01f5602e6177928751074e325792a654e1d92f0e238b8e8739656dd72b",
        strip_prefix = "github.com/google/go-querystring@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/go-querystring/com_github_google_go_querystring-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/go-querystring/com_github_google_go_querystring-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/go-querystring/com_github_google_go_querystring-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/go-querystring/com_github_google_go_querystring-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_gofuzz",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/gofuzz",
        sha256 = "5948f40af1923d8f98dc1d4191311030e40e0057fb255df19ebc0360f2faac16",
        strip_prefix = "github.com/google/gofuzz@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/gofuzz/com_github_google_gofuzz-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/gofuzz/com_github_google_gofuzz-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/gofuzz/com_github_google_gofuzz-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/gofuzz/com_github_google_gofuzz-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_licensecheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/licensecheck",
        sha256 = "0df7b4ca172de6ee28c525815e21fb5c2014f1e8dbe8879d099b1e019691ca7c",
        strip_prefix = "github.com/google/licensecheck@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/licensecheck/com_github_google_licensecheck-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/google/licensecheck/com_github_google_licensecheck-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/licensecheck/com_github_google_licensecheck-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/licensecheck/com_github_google_licensecheck-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_google_martian",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/martian",
        sha256 = "5bdd2ebd37dda1c0cf786db27707966c8624b288641da704b0e31c96b393ce70",
        strip_prefix = "github.com/google/martian@v2.1.0+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/martian/com_github_google_martian-v2.1.0+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/google/martian/com_github_google_martian-v2.1.0+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/martian/com_github_google_martian-v2.1.0+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/martian/com_github_google_martian-v2.1.0+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_google_martian_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/martian/v3",
        sha256 = "aa691c18a36d986d0505aab68925985faba03d72e15729ee1b97f919af8e628c",
        strip_prefix = "github.com/google/martian/v3@v3.3.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/martian/v3/com_github_google_martian_v3-v3.3.2.zip",
            "http://ats.apps.svc/gomod/github.com/google/martian/v3/com_github_google_martian_v3-v3.3.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/martian/v3/com_github_google_martian_v3-v3.3.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/martian/v3/com_github_google_martian_v3-v3.3.2.zip",
        ],
    )
    go_repository(
        name = "com_github_google_pprof",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/pprof",
        sha256 = "06752f6d2f5626adaa18120fb1ae2f96f6501f05c23022b64fc1a79f832b3c4d",
        strip_prefix = "github.com/google/pprof@v0.0.0-20241001023024-f4c0cfd0cf1d",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/pprof/com_github_google_pprof-v0.0.0-20241001023024-f4c0cfd0cf1d.zip",
            "http://ats.apps.svc/gomod/github.com/google/pprof/com_github_google_pprof-v0.0.0-20241001023024-f4c0cfd0cf1d.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/pprof/com_github_google_pprof-v0.0.0-20241001023024-f4c0cfd0cf1d.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/pprof/com_github_google_pprof-v0.0.0-20241001023024-f4c0cfd0cf1d.zip",
        ],
    )
    go_repository(
        name = "com_github_google_renameio",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/renameio",
        sha256 = "b8510bb34078691a20b8e4902d371afe0eb171b2daf953f67cb3960d1926ccf3",
        strip_prefix = "github.com/google/renameio@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/renameio/com_github_google_renameio-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/renameio/com_github_google_renameio-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/renameio/com_github_google_renameio-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/renameio/com_github_google_renameio-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_renameio_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/renameio/v2",
        sha256 = "6e2b3ddcedd6bb5ff669b8e294befc9a35c01ede30fd00a183fc637ce7c9fd8e",
        strip_prefix = "github.com/google/renameio/v2@v2.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/renameio/v2/com_github_google_renameio_v2-v2.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/renameio/v2/com_github_google_renameio_v2-v2.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/renameio/v2/com_github_google_renameio_v2-v2.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/renameio/v2/com_github_google_renameio_v2-v2.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_google_s2a_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/s2a-go",
        sha256 = "4392e675b6f0ff0b90f970c0280d63e34b32d077e1f8c0abd1006ad0dbeb2f2e",
        strip_prefix = "github.com/google/s2a-go@v0.1.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/s2a-go/com_github_google_s2a_go-v0.1.7.zip",
            "http://ats.apps.svc/gomod/github.com/google/s2a-go/com_github_google_s2a_go-v0.1.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/s2a-go/com_github_google_s2a_go-v0.1.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/s2a-go/com_github_google_s2a_go-v0.1.7.zip",
        ],
    )
    go_repository(
        name = "com_github_google_skylark",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/skylark",
        sha256 = "401bbeea49fb3939c4a7246da4154d411d4612881b510657cae4a5bfa05f8c21",
        strip_prefix = "github.com/google/skylark@v0.0.0-20181101142754-a5f7082aabed",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/skylark/com_github_google_skylark-v0.0.0-20181101142754-a5f7082aabed.zip",
            "http://ats.apps.svc/gomod/github.com/google/skylark/com_github_google_skylark-v0.0.0-20181101142754-a5f7082aabed.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/skylark/com_github_google_skylark-v0.0.0-20181101142754-a5f7082aabed.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/skylark/com_github_google_skylark-v0.0.0-20181101142754-a5f7082aabed.zip",
        ],
    )
    go_repository(
        name = "com_github_google_uuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/google/uuid",
        sha256 = "d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed",
        strip_prefix = "github.com/google/uuid@v1.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/google/uuid/com_github_google_uuid-v1.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/google/uuid/com_github_google_uuid-v1.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/google/uuid/com_github_google_uuid-v1.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/google/uuid/com_github_google_uuid-v1.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_googleapis_enterprise_certificate_proxy",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/googleapis/enterprise-certificate-proxy",
        sha256 = "56127cb8bea94f438c4e867f9217bdfc55865282953e54c74eee019575c1020e",
        strip_prefix = "github.com/googleapis/enterprise-certificate-proxy@v0.3.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/googleapis/enterprise-certificate-proxy/com_github_googleapis_enterprise_certificate_proxy-v0.3.2.zip",
            "http://ats.apps.svc/gomod/github.com/googleapis/enterprise-certificate-proxy/com_github_googleapis_enterprise_certificate_proxy-v0.3.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/googleapis/enterprise-certificate-proxy/com_github_googleapis_enterprise_certificate_proxy-v0.3.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/googleapis/enterprise-certificate-proxy/com_github_googleapis_enterprise_certificate_proxy-v0.3.2.zip",
        ],
    )
    go_repository(
        name = "com_github_googleapis_gax_go_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/googleapis/gax-go/v2",
        sha256 = "ac38116fc8588c111cdf2b42ef6d123f26859104ecd6844302120eb17b88700c",
        strip_prefix = "github.com/googleapis/gax-go/v2@v2.12.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/googleapis/gax-go/v2/com_github_googleapis_gax_go_v2-v2.12.3.zip",
            "http://ats.apps.svc/gomod/github.com/googleapis/gax-go/v2/com_github_googleapis_gax_go_v2-v2.12.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/googleapis/gax-go/v2/com_github_googleapis_gax_go_v2-v2.12.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/googleapis/gax-go/v2/com_github_googleapis_gax_go_v2-v2.12.3.zip",
        ],
    )
    go_repository(
        name = "com_github_gophercloud_gophercloud",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gophercloud/gophercloud",
        sha256 = "89d7a90a3bd552caa46946be9bc031d3231898423724c4ec2b97ce7a25923a58",
        strip_prefix = "github.com/gophercloud/gophercloud@v1.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gophercloud/gophercloud/com_github_gophercloud_gophercloud-v1.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/gophercloud/gophercloud/com_github_gophercloud_gophercloud-v1.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gophercloud/gophercloud/com_github_gophercloud_gophercloud-v1.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gophercloud/gophercloud/com_github_gophercloud_gophercloud-v1.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gordonklaus_ineffassign",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gordonklaus/ineffassign",
        sha256 = "75704a7f180532c5b8c274da14f6e9dddd3687a526a956ad39e0da3cc36b7b3e",
        strip_prefix = "github.com/gordonklaus/ineffassign@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gordonklaus/ineffassign/com_github_gordonklaus_ineffassign-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/gordonklaus/ineffassign/com_github_gordonklaus_ineffassign-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gordonklaus/ineffassign/com_github_gordonklaus_ineffassign-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gordonklaus/ineffassign/com_github_gordonklaus_ineffassign-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gorilla_css",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gorilla/css",
        sha256 = "d854362b9d723daf613b26aae0254723a4ed1bff680683c3e2a01aeb398168e5",
        strip_prefix = "github.com/gorilla/css@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gorilla/css/com_github_gorilla_css-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/gorilla/css/com_github_gorilla_css-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gorilla/css/com_github_gorilla_css-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gorilla/css/com_github_gorilla_css-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gorilla_handlers",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gorilla/handlers",
        sha256 = "700cb5572cef0b4c251fc63550d3a656d53b91cec845f19b6a16bdbc6795beec",
        strip_prefix = "github.com/gorilla/handlers@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gorilla/handlers/com_github_gorilla_handlers-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/gorilla/handlers/com_github_gorilla_handlers-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gorilla/handlers/com_github_gorilla_handlers-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gorilla/handlers/com_github_gorilla_handlers-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gorilla_mux",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gorilla/mux",
        sha256 = "728243623caa67f64e4a0b6c59dde3f762918d9e729266167ba46d8df56c193a",
        strip_prefix = "github.com/gorilla/mux@v1.8.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gorilla/mux/com_github_gorilla_mux-v1.8.1.zip",
            "http://ats.apps.svc/gomod/github.com/gorilla/mux/com_github_gorilla_mux-v1.8.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gorilla/mux/com_github_gorilla_mux-v1.8.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gorilla/mux/com_github_gorilla_mux-v1.8.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gorilla_websocket",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gorilla/websocket",
        sha256 = "e0183e81bbc710dbbcb9b2b206a89614dd3540ddfbbd59b52861edf953eda753",
        strip_prefix = "github.com/gorilla/websocket@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gorilla/websocket/com_github_gorilla_websocket-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/gorilla/websocket/com_github_gorilla_websocket-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gorilla/websocket/com_github_gorilla_websocket-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gorilla/websocket/com_github_gorilla_websocket-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gostaticanalysis_analysisutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gostaticanalysis/analysisutil",
        sha256 = "f372dd7390227402df610bb50bc0e278bb1fd34c893b2298c78801ea010c8849",
        strip_prefix = "github.com/gostaticanalysis/analysisutil@v0.7.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gostaticanalysis/analysisutil/com_github_gostaticanalysis_analysisutil-v0.7.1.zip",
            "http://ats.apps.svc/gomod/github.com/gostaticanalysis/analysisutil/com_github_gostaticanalysis_analysisutil-v0.7.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gostaticanalysis/analysisutil/com_github_gostaticanalysis_analysisutil-v0.7.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gostaticanalysis/analysisutil/com_github_gostaticanalysis_analysisutil-v0.7.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gostaticanalysis_comment",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gostaticanalysis/comment",
        sha256 = "2aa38212e1d557e5a6f1e8bdf4c94311f3678ab2c39443dcd5b8e2beb7b6f679",
        strip_prefix = "github.com/gostaticanalysis/comment@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gostaticanalysis/comment/com_github_gostaticanalysis_comment-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/gostaticanalysis/comment/com_github_gostaticanalysis_comment-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gostaticanalysis/comment/com_github_gostaticanalysis_comment-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gostaticanalysis/comment/com_github_gostaticanalysis_comment-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gostaticanalysis_forcetypeassert",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gostaticanalysis/forcetypeassert",
        sha256 = "2cb512be8293b92e2302d66194682042c0dbba4006ea391be400efca8fd59644",
        strip_prefix = "github.com/gostaticanalysis/forcetypeassert@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gostaticanalysis/forcetypeassert/com_github_gostaticanalysis_forcetypeassert-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/gostaticanalysis/forcetypeassert/com_github_gostaticanalysis_forcetypeassert-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gostaticanalysis/forcetypeassert/com_github_gostaticanalysis_forcetypeassert-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gostaticanalysis/forcetypeassert/com_github_gostaticanalysis_forcetypeassert-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_gostaticanalysis_nilerr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gostaticanalysis/nilerr",
        sha256 = "8c02f73130b5d0a3649d2b4cc35bce7930d294a8cbd676db29023e6bc20c6316",
        strip_prefix = "github.com/gostaticanalysis/nilerr@v0.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gostaticanalysis/nilerr/com_github_gostaticanalysis_nilerr-v0.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/gostaticanalysis/nilerr/com_github_gostaticanalysis_nilerr-v0.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gostaticanalysis/nilerr/com_github_gostaticanalysis_nilerr-v0.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gostaticanalysis/nilerr/com_github_gostaticanalysis_nilerr-v0.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_gostaticanalysis_testutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/gostaticanalysis/testutil",
        sha256 = "f432719688dd131fcbd50b8c37d986487fa3cc3bd7bc0a32f19a739b6786133f",
        strip_prefix = "github.com/gostaticanalysis/testutil@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/gostaticanalysis/testutil/com_github_gostaticanalysis_testutil-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/gostaticanalysis/testutil/com_github_gostaticanalysis_testutil-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/gostaticanalysis/testutil/com_github_gostaticanalysis_testutil-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/gostaticanalysis/testutil/com_github_gostaticanalysis_testutil-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_grafana_pyroscope_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grafana/pyroscope-go",
        sha256 = "dca06f5f9123ff846277d92994e1957b7b61312b942c7cefeea319fd613e15db",
        strip_prefix = "github.com/grafana/pyroscope-go@v1.2.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grafana/pyroscope-go/com_github_grafana_pyroscope_go-v1.2.4.zip",
            "http://ats.apps.svc/gomod/github.com/grafana/pyroscope-go/com_github_grafana_pyroscope_go-v1.2.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grafana/pyroscope-go/com_github_grafana_pyroscope_go-v1.2.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grafana/pyroscope-go/com_github_grafana_pyroscope_go-v1.2.4.zip",
        ],
    )
    go_repository(
        name = "com_github_grafana_pyroscope_go_godeltaprof",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grafana/pyroscope-go/godeltaprof",
        sha256 = "d9678e1b8c6b00c500fd890d584e92dd0b9ea33b13337f41f4df5d6649b16ed3",
        strip_prefix = "github.com/grafana/pyroscope-go/godeltaprof@v0.1.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grafana/pyroscope-go/godeltaprof/com_github_grafana_pyroscope_go_godeltaprof-v0.1.8.zip",
            "http://ats.apps.svc/gomod/github.com/grafana/pyroscope-go/godeltaprof/com_github_grafana_pyroscope_go_godeltaprof-v0.1.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grafana/pyroscope-go/godeltaprof/com_github_grafana_pyroscope_go_godeltaprof-v0.1.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grafana/pyroscope-go/godeltaprof/com_github_grafana_pyroscope_go_godeltaprof-v0.1.8.zip",
        ],
    )
    go_repository(
        name = "com_github_grafana_regexp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grafana/regexp",
        sha256 = "32777ad2e39bac06b359b0d93460530a41a1e0cb7cfd92faac82feb364ce8c91",
        strip_prefix = "github.com/grafana/regexp@v0.0.0-20221122212121-6b5c0a4cb7fd",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grafana/regexp/com_github_grafana_regexp-v0.0.0-20221122212121-6b5c0a4cb7fd.zip",
            "http://ats.apps.svc/gomod/github.com/grafana/regexp/com_github_grafana_regexp-v0.0.0-20221122212121-6b5c0a4cb7fd.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grafana/regexp/com_github_grafana_regexp-v0.0.0-20221122212121-6b5c0a4cb7fd.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grafana/regexp/com_github_grafana_regexp-v0.0.0-20221122212121-6b5c0a4cb7fd.zip",
        ],
    )
    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_middleware",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grpc-ecosystem/go-grpc-middleware",
        sha256 = "e4e1845280f93ea81648d0e48d3c17e6610c7916a49171f73c150fbde8fa9bc0",
        strip_prefix = "github.com/grpc-ecosystem/go-grpc-middleware@v1.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grpc-ecosystem/go-grpc-middleware/com_github_grpc_ecosystem_go_grpc_middleware-v1.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/grpc-ecosystem/go-grpc-middleware/com_github_grpc_ecosystem_go_grpc_middleware-v1.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grpc-ecosystem/go-grpc-middleware/com_github_grpc_ecosystem_go_grpc_middleware-v1.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grpc-ecosystem/go-grpc-middleware/com_github_grpc_ecosystem_go_grpc_middleware-v1.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_grpc_ecosystem_go_grpc_prometheus",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grpc-ecosystem/go-grpc-prometheus",
        sha256 = "124dfc63aa52611a2882417e685c0452d4d99d64c13836a6a6747675e911fc17",
        strip_prefix = "github.com/grpc-ecosystem/go-grpc-prometheus@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grpc-ecosystem/go-grpc-prometheus/com_github_grpc_ecosystem_go_grpc_prometheus-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/grpc-ecosystem/go-grpc-prometheus/com_github_grpc_ecosystem_go_grpc_prometheus-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grpc-ecosystem/go-grpc-prometheus/com_github_grpc_ecosystem_go_grpc_prometheus-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grpc-ecosystem/go-grpc-prometheus/com_github_grpc_ecosystem_go_grpc_prometheus-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_grpc_ecosystem_grpc_gateway",
        build_file_proto_mode = "disable_global",
        build_naming_convention = "go_default_library",
        importpath = "github.com/grpc-ecosystem/grpc-gateway",
        patch_args = ["-p1"],
        patches = [
            "//build/patches:com_github_grpc_ecosystem_grpc_gateway.patch",
        ],
        sha256 = "377b03aef288b34ed894449d3ddba40d525dd7fb55de6e79045cdf499e7fe565",
        strip_prefix = "github.com/grpc-ecosystem/grpc-gateway@v1.16.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grpc-ecosystem/grpc-gateway/com_github_grpc_ecosystem_grpc_gateway-v1.16.0.zip",
            "http://ats.apps.svc/gomod/github.com/grpc-ecosystem/grpc-gateway/com_github_grpc_ecosystem_grpc_gateway-v1.16.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grpc-ecosystem/grpc-gateway/com_github_grpc_ecosystem_grpc_gateway-v1.16.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grpc-ecosystem/grpc-gateway/com_github_grpc_ecosystem_grpc_gateway-v1.16.0.zip",
        ],
    )
    go_repository(
        name = "com_github_grpc_ecosystem_grpc_gateway_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/grpc-ecosystem/grpc-gateway/v2",
        sha256 = "31c467951356be11a0c646299cbe2155b3254a68b643888a1ef7a7511cf1b1cf",
        strip_prefix = "github.com/grpc-ecosystem/grpc-gateway/v2@v2.19.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/grpc-ecosystem/grpc-gateway/v2/com_github_grpc_ecosystem_grpc_gateway_v2-v2.19.1.zip",
            "http://ats.apps.svc/gomod/github.com/grpc-ecosystem/grpc-gateway/v2/com_github_grpc_ecosystem_grpc_gateway_v2-v2.19.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/grpc-ecosystem/grpc-gateway/v2/com_github_grpc_ecosystem_grpc_gateway_v2-v2.19.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/grpc-ecosystem/grpc-gateway/v2/com_github_grpc_ecosystem_grpc_gateway_v2-v2.19.1.zip",
        ],
    )
    go_repository(
        name = "com_github_guptarohit_asciigraph",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/guptarohit/asciigraph",
        sha256 = "c2b81da57a50425d313a684efd13d9741c4e9df4c3cca92dea34d562d34271a1",
        strip_prefix = "github.com/guptarohit/asciigraph@v0.5.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/guptarohit/asciigraph/com_github_guptarohit_asciigraph-v0.5.5.zip",
            "http://ats.apps.svc/gomod/github.com/guptarohit/asciigraph/com_github_guptarohit_asciigraph-v0.5.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/guptarohit/asciigraph/com_github_guptarohit_asciigraph-v0.5.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/guptarohit/asciigraph/com_github_guptarohit_asciigraph-v0.5.5.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_consul_api",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/consul/api",
        sha256 = "bacf525671822c026b37896d9a7225411bd021e2afd7dd886f846728d51ef62e",
        strip_prefix = "github.com/hashicorp/consul/api@v1.27.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/consul/api/com_github_hashicorp_consul_api-v1.27.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/consul/api/com_github_hashicorp_consul_api-v1.27.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/consul/api/com_github_hashicorp_consul_api-v1.27.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/consul/api/com_github_hashicorp_consul_api-v1.27.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_cronexpr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/cronexpr",
        sha256 = "d4a26ea051d2e1c3518ae9bae405db83f91b4b3bf2cb9fec903aff10e447cfa7",
        strip_prefix = "github.com/hashicorp/cronexpr@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/cronexpr/com_github_hashicorp_cronexpr-v1.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/cronexpr/com_github_hashicorp_cronexpr-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/cronexpr/com_github_hashicorp_cronexpr-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/cronexpr/com_github_hashicorp_cronexpr-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_errwrap",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/errwrap",
        sha256 = "209ae99bc039443e28e4d6bb66517d1756d9468b7578d31f1b63a28103d8e18c",
        strip_prefix = "github.com/hashicorp/errwrap@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/errwrap/com_github_hashicorp_errwrap-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/errwrap/com_github_hashicorp_errwrap-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/errwrap/com_github_hashicorp_errwrap-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/errwrap/com_github_hashicorp_errwrap-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_cleanhttp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-cleanhttp",
        sha256 = "e9f3dcfcb33172ba499b4f8e888169252d7f1e072082182124a6e2053523f7df",
        strip_prefix = "github.com/hashicorp/go-cleanhttp@v0.5.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-cleanhttp/com_github_hashicorp_go_cleanhttp-v0.5.2.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-cleanhttp/com_github_hashicorp_go_cleanhttp-v0.5.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-cleanhttp/com_github_hashicorp_go_cleanhttp-v0.5.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-cleanhttp/com_github_hashicorp_go_cleanhttp-v0.5.2.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_hclog",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-hclog",
        sha256 = "37eae99309c542b32aa7e28bcd0236e1ded8acce4aadc25d8e5a8ab03066482d",
        strip_prefix = "github.com/hashicorp/go-hclog@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-hclog/com_github_hashicorp_go_hclog-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-hclog/com_github_hashicorp_go_hclog-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-hclog/com_github_hashicorp_go_hclog-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-hclog/com_github_hashicorp_go_hclog-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_immutable_radix",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-immutable-radix",
        sha256 = "47f3d79b57082d5db3f966547ad4de2a00544dfb362790fbf2cef1a161b4de3f",
        strip_prefix = "github.com/hashicorp/go-immutable-radix@v1.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-immutable-radix/com_github_hashicorp_go_immutable_radix-v1.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-immutable-radix/com_github_hashicorp_go_immutable_radix-v1.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-immutable-radix/com_github_hashicorp_go_immutable_radix-v1.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-immutable-radix/com_github_hashicorp_go_immutable_radix-v1.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_immutable_radix_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-immutable-radix/v2",
        sha256 = "60e7f581c8055e474b1ff5a9d88a68a9f755d0b3dc6d8e05fc0556b6e86de995",
        strip_prefix = "github.com/hashicorp/go-immutable-radix/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-immutable-radix/v2/com_github_hashicorp_go_immutable_radix_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-immutable-radix/v2/com_github_hashicorp_go_immutable_radix_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-immutable-radix/v2/com_github_hashicorp_go_immutable_radix_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-immutable-radix/v2/com_github_hashicorp_go_immutable_radix_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_multierror",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-multierror",
        sha256 = "972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c",
        strip_prefix = "github.com/hashicorp/go-multierror@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-multierror/com_github_hashicorp_go_multierror-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-multierror/com_github_hashicorp_go_multierror-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-multierror/com_github_hashicorp_go_multierror-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-multierror/com_github_hashicorp_go_multierror-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_retryablehttp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-retryablehttp",
        sha256 = "00f6d85c5c8b327f56d49ad48ef1d2df94affea340ca46ce827415ba75db4712",
        strip_prefix = "github.com/hashicorp/go-retryablehttp@v0.7.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-retryablehttp/com_github_hashicorp_go_retryablehttp-v0.7.4.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-retryablehttp/com_github_hashicorp_go_retryablehttp-v0.7.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-retryablehttp/com_github_hashicorp_go_retryablehttp-v0.7.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-retryablehttp/com_github_hashicorp_go_retryablehttp-v0.7.4.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_rootcerts",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-rootcerts",
        sha256 = "864a48e642e87a273fb5ef60bb3575bd74a7090510f93143163fa6700be31948",
        strip_prefix = "github.com/hashicorp/go-rootcerts@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-rootcerts/com_github_hashicorp_go_rootcerts-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-rootcerts/com_github_hashicorp_go_rootcerts-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-rootcerts/com_github_hashicorp_go_rootcerts-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-rootcerts/com_github_hashicorp_go_rootcerts-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_uuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-uuid",
        sha256 = "4b8a152aba5b6db8093f240f11f6999c4401c01e13458228ee023c0682cc5c1d",
        strip_prefix = "github.com/hashicorp/go-uuid@v0.0.0-20180228145832-27454136f036",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-uuid/com_github_hashicorp_go_uuid-v0.0.0-20180228145832-27454136f036.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-uuid/com_github_hashicorp_go_uuid-v0.0.0-20180228145832-27454136f036.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-uuid/com_github_hashicorp_go_uuid-v0.0.0-20180228145832-27454136f036.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-uuid/com_github_hashicorp_go_uuid-v0.0.0-20180228145832-27454136f036.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_go_version",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/go-version",
        sha256 = "341bd10080b7f7e0754bab07afb09f9a37e997b5fdb1a528266972a890309053",
        strip_prefix = "github.com/hashicorp/go-version@v1.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/go-version/com_github_hashicorp_go_version-v1.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/go-version/com_github_hashicorp_go_version-v1.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/go-version/com_github_hashicorp_go_version-v1.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/go-version/com_github_hashicorp_go_version-v1.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_golang_lru",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/golang-lru",
        sha256 = "75a21bee633745563dc3161386b2245fc126f882d2e5d2d97c0c6899511a5faf",
        strip_prefix = "github.com/hashicorp/golang-lru@v0.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/golang-lru/com_github_hashicorp_golang_lru-v0.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/golang-lru/com_github_hashicorp_golang_lru-v0.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/golang-lru/com_github_hashicorp_golang_lru-v0.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/golang-lru/com_github_hashicorp_golang_lru-v0.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_golang_lru_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/golang-lru/v2",
        sha256 = "2eb92ff13970bccd460efae14255bfc03bb51474da0137e477a60f95561acc30",
        strip_prefix = "github.com/hashicorp/golang-lru/v2@v2.0.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/golang-lru/v2/com_github_hashicorp_golang_lru_v2-v2.0.7.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/golang-lru/v2/com_github_hashicorp_golang_lru_v2-v2.0.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/golang-lru/v2/com_github_hashicorp_golang_lru_v2-v2.0.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/golang-lru/v2/com_github_hashicorp_golang_lru_v2-v2.0.7.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_hcl",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/hcl",
        sha256 = "54149a2e5121b3e81f961c79210e63d6798eb63de28d2599ee59ade1fa76c82b",
        strip_prefix = "github.com/hashicorp/hcl@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/hcl/com_github_hashicorp_hcl-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/hcl/com_github_hashicorp_hcl-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/hcl/com_github_hashicorp_hcl-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/hcl/com_github_hashicorp_hcl-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_nomad_api",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/nomad/api",
        sha256 = "84f0a19132b5bc9b3694d113d0bd551a605717728f6b13a474db9bfbec502bc6",
        strip_prefix = "github.com/hashicorp/nomad/api@v0.0.0-20230721134942-515895c7690c",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/nomad/api/com_github_hashicorp_nomad_api-v0.0.0-20230721134942-515895c7690c.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/nomad/api/com_github_hashicorp_nomad_api-v0.0.0-20230721134942-515895c7690c.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/nomad/api/com_github_hashicorp_nomad_api-v0.0.0-20230721134942-515895c7690c.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/nomad/api/com_github_hashicorp_nomad_api-v0.0.0-20230721134942-515895c7690c.zip",
        ],
    )
    go_repository(
        name = "com_github_hashicorp_serf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hashicorp/serf",
        sha256 = "661b6ad5df497dcda0f581607b003e40646ef9f3ca09d12bdeec7cb3d16ad370",
        strip_prefix = "github.com/hashicorp/serf@v0.10.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hashicorp/serf/com_github_hashicorp_serf-v0.10.1.zip",
            "http://ats.apps.svc/gomod/github.com/hashicorp/serf/com_github_hashicorp_serf-v0.10.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hashicorp/serf/com_github_hashicorp_serf-v0.10.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hashicorp/serf/com_github_hashicorp_serf-v0.10.1.zip",
        ],
    )
    go_repository(
        name = "com_github_hdrhistogram_hdrhistogram_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/HdrHistogram/hdrhistogram-go",
        sha256 = "bbc1d64d3179248c78ffa3729ad2ab696ed1ff14874f37d8d4fc4a5a235fa77f",
        strip_prefix = "github.com/HdrHistogram/hdrhistogram-go@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/HdrHistogram/hdrhistogram-go/com_github_hdrhistogram_hdrhistogram_go-v1.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/HdrHistogram/hdrhistogram-go/com_github_hdrhistogram_hdrhistogram_go-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/HdrHistogram/hdrhistogram-go/com_github_hdrhistogram_hdrhistogram_go-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/HdrHistogram/hdrhistogram-go/com_github_hdrhistogram_hdrhistogram_go-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_hetznercloud_hcloud_go_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hetznercloud/hcloud-go/v2",
        sha256 = "751828960948066c67e6682647ac68ed3141865d48a9e0e80c6444e0e00f55a1",
        strip_prefix = "github.com/hetznercloud/hcloud-go/v2@v2.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hetznercloud/hcloud-go/v2/com_github_hetznercloud_hcloud_go_v2-v2.6.0.zip",
            "http://ats.apps.svc/gomod/github.com/hetznercloud/hcloud-go/v2/com_github_hetznercloud_hcloud_go_v2-v2.6.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hetznercloud/hcloud-go/v2/com_github_hetznercloud_hcloud_go_v2-v2.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hetznercloud/hcloud-go/v2/com_github_hetznercloud_hcloud_go_v2-v2.6.0.zip",
        ],
    )
    go_repository(
        name = "com_github_hexops_gotextdiff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hexops/gotextdiff",
        sha256 = "a10c3942f09bc5132268d22d4bb9d0c1849122d533fe8cdf65ea69da05cebbaf",
        strip_prefix = "github.com/hexops/gotextdiff@v1.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hexops/gotextdiff/com_github_hexops_gotextdiff-v1.0.3.zip",
            "http://ats.apps.svc/gomod/github.com/hexops/gotextdiff/com_github_hexops_gotextdiff-v1.0.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hexops/gotextdiff/com_github_hexops_gotextdiff-v1.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hexops/gotextdiff/com_github_hexops_gotextdiff-v1.0.3.zip",
        ],
    )
    go_repository(
        name = "com_github_huandu_xstrings",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/huandu/xstrings",
        sha256 = "20b20f552a0eba0c3cf6aa1c9ed109fe0ab894a966477491267f21150856c6fc",
        strip_prefix = "github.com/huandu/xstrings@v1.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/huandu/xstrings/com_github_huandu_xstrings-v1.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/huandu/xstrings/com_github_huandu_xstrings-v1.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/huandu/xstrings/com_github_huandu_xstrings-v1.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/huandu/xstrings/com_github_huandu_xstrings-v1.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_hydrogen18_memlistener",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/hydrogen18/memlistener",
        sha256 = "c47c6f44a9c1096c1b61f6c49be924c42e69545ca23a008881d950ee942a2268",
        strip_prefix = "github.com/hydrogen18/memlistener@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/hydrogen18/memlistener/com_github_hydrogen18_memlistener-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/hydrogen18/memlistener/com_github_hydrogen18_memlistener-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/hydrogen18/memlistener/com_github_hydrogen18_memlistener-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/hydrogen18/memlistener/com_github_hydrogen18_memlistener-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ianlancetaylor_demangle",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ianlancetaylor/demangle",
        sha256 = "fce8f9022445dfed0afd86e09efd896fc48d491f6059b32a71fe887de5d437a6",
        strip_prefix = "github.com/ianlancetaylor/demangle@v0.0.0-20240312041847-bd984b5ce465",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ianlancetaylor/demangle/com_github_ianlancetaylor_demangle-v0.0.0-20240312041847-bd984b5ce465.zip",
            "http://ats.apps.svc/gomod/github.com/ianlancetaylor/demangle/com_github_ianlancetaylor_demangle-v0.0.0-20240312041847-bd984b5ce465.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ianlancetaylor/demangle/com_github_ianlancetaylor_demangle-v0.0.0-20240312041847-bd984b5ce465.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ianlancetaylor/demangle/com_github_ianlancetaylor_demangle-v0.0.0-20240312041847-bd984b5ce465.zip",
        ],
    )
    go_repository(
        name = "com_github_imdario_mergo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/imdario/mergo",
        sha256 = "536b0b87ec2b9f02d759a3a01604043b538e15e62924a29e34cfc2b16a1cf580",
        strip_prefix = "github.com/imdario/mergo@v0.3.16",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/imdario/mergo/com_github_imdario_mergo-v0.3.16.zip",
            "http://ats.apps.svc/gomod/github.com/imdario/mergo/com_github_imdario_mergo-v0.3.16.zip",
            "https://cache.hawkingrei.com/gomod/github.com/imdario/mergo/com_github_imdario_mergo-v0.3.16.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/imdario/mergo/com_github_imdario_mergo-v0.3.16.zip",
        ],
    )
    go_repository(
        name = "com_github_inconshreveable_mousetrap",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/inconshreveable/mousetrap",
        sha256 = "526674de624d7db108cfe7653ef110ccdfd97bc85026254224815567928ed243",
        strip_prefix = "github.com/inconshreveable/mousetrap@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/inconshreveable/mousetrap/com_github_inconshreveable_mousetrap-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/inconshreveable/mousetrap/com_github_inconshreveable_mousetrap-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/inconshreveable/mousetrap/com_github_inconshreveable_mousetrap-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/inconshreveable/mousetrap/com_github_inconshreveable_mousetrap-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_influxdata_tdigest",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/influxdata/tdigest",
        sha256 = "849177b840452dee7b1986b962c5612f75a56036af4cb42cbf227113c50b3dc4",
        strip_prefix = "github.com/influxdata/tdigest@v0.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/influxdata/tdigest/com_github_influxdata_tdigest-v0.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/influxdata/tdigest/com_github_influxdata_tdigest-v0.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/influxdata/tdigest/com_github_influxdata_tdigest-v0.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/influxdata/tdigest/com_github_influxdata_tdigest-v0.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ionos_cloud_sdk_go_v6",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ionos-cloud/sdk-go/v6",
        sha256 = "f9538685d901f7c96779dc5b1341a3a5401ae235dd82ee700ded27c838911e4d",
        strip_prefix = "github.com/ionos-cloud/sdk-go/v6@v6.1.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ionos-cloud/sdk-go/v6/com_github_ionos_cloud_sdk_go_v6-v6.1.11.zip",
            "http://ats.apps.svc/gomod/github.com/ionos-cloud/sdk-go/v6/com_github_ionos_cloud_sdk_go_v6-v6.1.11.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ionos-cloud/sdk-go/v6/com_github_ionos_cloud_sdk_go_v6-v6.1.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ionos-cloud/sdk-go/v6/com_github_ionos_cloud_sdk_go_v6-v6.1.11.zip",
        ],
    )
    go_repository(
        name = "com_github_iris_contrib_schema",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/iris-contrib/schema",
        sha256 = "1812c2d72ad6f4e9c0c564c28edea299d4382206ddcaf7e2b80df903ccfdbad1",
        strip_prefix = "github.com/iris-contrib/schema@v0.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/iris-contrib/schema/com_github_iris_contrib_schema-v0.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/iris-contrib/schema/com_github_iris_contrib_schema-v0.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/iris-contrib/schema/com_github_iris_contrib_schema-v0.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/iris-contrib/schema/com_github_iris_contrib_schema-v0.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_jcmturner_gofork",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jcmturner/gofork",
        sha256 = "dd93724b2bb93705db6f5c8a86f48802cbb4a831883cb82c4ce5b50f5d7fc854",
        strip_prefix = "github.com/jcmturner/gofork@v0.0.0-20180107083740-2aebee971930",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jcmturner/gofork/com_github_jcmturner_gofork-v0.0.0-20180107083740-2aebee971930.zip",
            "http://ats.apps.svc/gomod/github.com/jcmturner/gofork/com_github_jcmturner_gofork-v0.0.0-20180107083740-2aebee971930.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jcmturner/gofork/com_github_jcmturner_gofork-v0.0.0-20180107083740-2aebee971930.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jcmturner/gofork/com_github_jcmturner_gofork-v0.0.0-20180107083740-2aebee971930.zip",
        ],
    )
    go_repository(
        name = "com_github_jedib0t_go_pretty_v6",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jedib0t/go-pretty/v6",
        sha256 = "4d1f6a514d7efa48c0fae2d70ee0a5510fe2b73cf7e3460f3f75f545bff6374c",
        strip_prefix = "github.com/jedib0t/go-pretty/v6@v6.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jedib0t/go-pretty/v6/com_github_jedib0t_go_pretty_v6-v6.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/jedib0t/go-pretty/v6/com_github_jedib0t_go_pretty_v6-v6.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jedib0t/go-pretty/v6/com_github_jedib0t_go_pretty_v6-v6.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jedib0t/go-pretty/v6/com_github_jedib0t_go_pretty_v6-v6.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_jellydator_ttlcache_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jellydator/ttlcache/v3",
        sha256 = "75cabcc118414bc9e42cef6769fffc0c500954f2ef1988a3797aee0f4351f306",
        strip_prefix = "github.com/jellydator/ttlcache/v3@v3.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jellydator/ttlcache/v3/com_github_jellydator_ttlcache_v3-v3.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/jellydator/ttlcache/v3/com_github_jellydator_ttlcache_v3-v3.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jellydator/ttlcache/v3/com_github_jellydator_ttlcache_v3-v3.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jellydator/ttlcache/v3/com_github_jellydator_ttlcache_v3-v3.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_jfcg_opt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jfcg/opt",
        sha256 = "d774e375f6827f16be051e177407bb3217e051cf4285449788abff3ebf01a468",
        strip_prefix = "github.com/jfcg/opt@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jfcg/opt/com_github_jfcg_opt-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/jfcg/opt/com_github_jfcg_opt-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jfcg/opt/com_github_jfcg_opt-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jfcg/opt/com_github_jfcg_opt-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_jfcg_rng",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jfcg/rng",
        sha256 = "8c450d237ea8ba22b6bc6337dcd11519fd6d04c2b31b9b38e5c26ae04ed7cae8",
        strip_prefix = "github.com/jfcg/rng@v1.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jfcg/rng/com_github_jfcg_rng-v1.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/jfcg/rng/com_github_jfcg_rng-v1.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jfcg/rng/com_github_jfcg_rng-v1.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jfcg/rng/com_github_jfcg_rng-v1.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_jfcg_sixb",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jfcg/sixb",
        sha256 = "5eda29ec69dff767e5353325eab7b2edac5911fcbbaf84f42c0513ab50b76952",
        strip_prefix = "github.com/jfcg/sixb@v1.3.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jfcg/sixb/com_github_jfcg_sixb-v1.3.8.zip",
            "http://ats.apps.svc/gomod/github.com/jfcg/sixb/com_github_jfcg_sixb-v1.3.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jfcg/sixb/com_github_jfcg_sixb-v1.3.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jfcg/sixb/com_github_jfcg_sixb-v1.3.8.zip",
        ],
    )
    go_repository(
        name = "com_github_jfcg_sorty_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jfcg/sorty/v2",
        sha256 = "4a126a66ee9237c696a038eff39710b55d92a846f807a5005dde35f4a0b869e3",
        strip_prefix = "github.com/jfcg/sorty/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jfcg/sorty/v2/com_github_jfcg_sorty_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/jfcg/sorty/v2/com_github_jfcg_sorty_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jfcg/sorty/v2/com_github_jfcg_sorty_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jfcg/sorty/v2/com_github_jfcg_sorty_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_jgautheron_goconst",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jgautheron/goconst",
        sha256 = "498330431cb96aa29beba8b83500d51f02992b010ea6effbbf872cc8002b0bf8",
        strip_prefix = "github.com/jgautheron/goconst@v1.8.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jgautheron/goconst/com_github_jgautheron_goconst-v1.8.2.zip",
            "http://ats.apps.svc/gomod/github.com/jgautheron/goconst/com_github_jgautheron_goconst-v1.8.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jgautheron/goconst/com_github_jgautheron_goconst-v1.8.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jgautheron/goconst/com_github_jgautheron_goconst-v1.8.2.zip",
        ],
    )
    go_repository(
        name = "com_github_jingyugao_rowserrcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jingyugao/rowserrcheck",
        sha256 = "500e58a8a78797fd1c470f397d6c23116861bd38d7a66fdbfe7e3fee7a7f8a6c",
        strip_prefix = "github.com/jingyugao/rowserrcheck@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jingyugao/rowserrcheck/com_github_jingyugao_rowserrcheck-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/jingyugao/rowserrcheck/com_github_jingyugao_rowserrcheck-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jingyugao/rowserrcheck/com_github_jingyugao_rowserrcheck-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jingyugao/rowserrcheck/com_github_jingyugao_rowserrcheck-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_jinzhu_inflection",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jinzhu/inflection",
        sha256 = "cf1087a6f6653ed5f366f85cf0110bbbf581d4e9bc8a4d1a9b56765d94b546c3",
        strip_prefix = "github.com/jinzhu/inflection@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jinzhu/inflection/com_github_jinzhu_inflection-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/jinzhu/inflection/com_github_jinzhu_inflection-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jinzhu/inflection/com_github_jinzhu_inflection-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jinzhu/inflection/com_github_jinzhu_inflection-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_jinzhu_now",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jinzhu/now",
        sha256 = "1223dc55db616f156c1f1467adc2c88f786905df3cc3cb4fd5161badd654c62b",
        strip_prefix = "github.com/jinzhu/now@v1.1.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jinzhu/now/com_github_jinzhu_now-v1.1.5.zip",
            "http://ats.apps.svc/gomod/github.com/jinzhu/now/com_github_jinzhu_now-v1.1.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jinzhu/now/com_github_jinzhu_now-v1.1.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jinzhu/now/com_github_jinzhu_now-v1.1.5.zip",
        ],
    )
    go_repository(
        name = "com_github_jjti_go_spancheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jjti/go-spancheck",
        sha256 = "e471b8a88dbe6fe431a06bf777248eb2fff81c64f44840e2e0a1f2ef407949d7",
        strip_prefix = "github.com/jjti/go-spancheck@v0.6.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jjti/go-spancheck/com_github_jjti_go_spancheck-v0.6.5.zip",
            "http://ats.apps.svc/gomod/github.com/jjti/go-spancheck/com_github_jjti_go_spancheck-v0.6.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jjti/go-spancheck/com_github_jjti_go_spancheck-v0.6.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jjti/go-spancheck/com_github_jjti_go_spancheck-v0.6.5.zip",
        ],
    )
    go_repository(
        name = "com_github_jmespath_go_jmespath",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jmespath/go-jmespath",
        sha256 = "d1f77b6790d7c4321a74260f3675683d3ac06b0a614b5f83e870beae0a8b2867",
        strip_prefix = "github.com/jmespath/go-jmespath@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jmespath/go-jmespath/com_github_jmespath_go_jmespath-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/jmespath/go-jmespath/com_github_jmespath_go_jmespath-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jmespath/go-jmespath/com_github_jmespath_go_jmespath-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jmespath/go-jmespath/com_github_jmespath_go_jmespath-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_jmespath_go_jmespath_internal_testify",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jmespath/go-jmespath/internal/testify",
        sha256 = "338f73832eb2a63ab0c912197e653c7b62426fc4387e0a76ab0d43c65e29b3e1",
        strip_prefix = "github.com/jmespath/go-jmespath/internal/testify@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jmespath/go-jmespath/internal/testify/com_github_jmespath_go_jmespath_internal_testify-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/jmespath/go-jmespath/internal/testify/com_github_jmespath_go_jmespath_internal_testify-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jmespath/go-jmespath/internal/testify/com_github_jmespath_go_jmespath_internal_testify-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jmespath/go-jmespath/internal/testify/com_github_jmespath_go_jmespath_internal_testify-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_johannesboyne_gofakes3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/johannesboyne/gofakes3",
        sha256 = "b0ba2f7ee1765c24d88f2c5c3d478992f03d40c72531d3725696baa5fdad4a73",
        strip_prefix = "github.com/johannesboyne/gofakes3@v0.0.0-20230506070712-04da935ef877",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/johannesboyne/gofakes3/com_github_johannesboyne_gofakes3-v0.0.0-20230506070712-04da935ef877.zip",
            "http://ats.apps.svc/gomod/github.com/johannesboyne/gofakes3/com_github_johannesboyne_gofakes3-v0.0.0-20230506070712-04da935ef877.zip",
            "https://cache.hawkingrei.com/gomod/github.com/johannesboyne/gofakes3/com_github_johannesboyne_gofakes3-v0.0.0-20230506070712-04da935ef877.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/johannesboyne/gofakes3/com_github_johannesboyne_gofakes3-v0.0.0-20230506070712-04da935ef877.zip",
        ],
    )
    go_repository(
        name = "com_github_johncgriffin_overflow",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/JohnCGriffin/overflow",
        sha256 = "8ad4da840214861386d243127290666cc54eb914d1f4a8856523481876af2a09",
        strip_prefix = "github.com/JohnCGriffin/overflow@v0.0.0-20211019200055-46fa312c352c",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/JohnCGriffin/overflow/com_github_johncgriffin_overflow-v0.0.0-20211019200055-46fa312c352c.zip",
            "http://ats.apps.svc/gomod/github.com/JohnCGriffin/overflow/com_github_johncgriffin_overflow-v0.0.0-20211019200055-46fa312c352c.zip",
            "https://cache.hawkingrei.com/gomod/github.com/JohnCGriffin/overflow/com_github_johncgriffin_overflow-v0.0.0-20211019200055-46fa312c352c.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/JohnCGriffin/overflow/com_github_johncgriffin_overflow-v0.0.0-20211019200055-46fa312c352c.zip",
        ],
    )
    go_repository(
        name = "com_github_joho_sqltocsv",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/joho/sqltocsv",
        sha256 = "62bb4ce0bd45a58c294aecdbfe256437747102de4bbe684c84322091661f1122",
        strip_prefix = "github.com/joho/sqltocsv@v0.0.0-20210428211105-a6d6801d59df",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/joho/sqltocsv/com_github_joho_sqltocsv-v0.0.0-20210428211105-a6d6801d59df.zip",
            "http://ats.apps.svc/gomod/github.com/joho/sqltocsv/com_github_joho_sqltocsv-v0.0.0-20210428211105-a6d6801d59df.zip",
            "https://cache.hawkingrei.com/gomod/github.com/joho/sqltocsv/com_github_joho_sqltocsv-v0.0.0-20210428211105-a6d6801d59df.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/joho/sqltocsv/com_github_joho_sqltocsv-v0.0.0-20210428211105-a6d6801d59df.zip",
        ],
    )
    go_repository(
        name = "com_github_joker_jade",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Joker/jade",
        sha256 = "33ab19f851ef3c58983eeb66f608c01be312ebac0f2cea61df5218490d6b5043",
        strip_prefix = "github.com/Joker/jade@v1.1.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Joker/jade/com_github_joker_jade-v1.1.3.zip",
            "http://ats.apps.svc/gomod/github.com/Joker/jade/com_github_joker_jade-v1.1.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Joker/jade/com_github_joker_jade-v1.1.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Joker/jade/com_github_joker_jade-v1.1.3.zip",
        ],
    )
    go_repository(
        name = "com_github_jonboulle_clockwork",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jonboulle/clockwork",
        sha256 = "20b3f45f363d05fce53618c059c9251860a5f3411f8d71b8b85b4e35b9060294",
        strip_prefix = "github.com/jonboulle/clockwork@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jonboulle/clockwork/com_github_jonboulle_clockwork-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/jonboulle/clockwork/com_github_jonboulle_clockwork-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jonboulle/clockwork/com_github_jonboulle_clockwork-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jonboulle/clockwork/com_github_jonboulle_clockwork-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_josharian_intern",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/josharian/intern",
        sha256 = "5679bfd11c14adccdb45bd1a0f9cf4b445b95caeed6fb507ba96ecced11c248d",
        strip_prefix = "github.com/josharian/intern@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/josharian/intern/com_github_josharian_intern-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/josharian/intern/com_github_josharian_intern-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/josharian/intern/com_github_josharian_intern-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/josharian/intern/com_github_josharian_intern-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_jpillora_backoff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jpillora/backoff",
        sha256 = "f856692c725143c49b9cceabfbca8bc93d3dbde84a0aaa53fb26ed3774c220cc",
        strip_prefix = "github.com/jpillora/backoff@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jpillora/backoff/com_github_jpillora_backoff-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/jpillora/backoff/com_github_jpillora_backoff-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jpillora/backoff/com_github_jpillora_backoff-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jpillora/backoff/com_github_jpillora_backoff-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_json_iterator_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/json-iterator/go",
        sha256 = "d001ea57081afd0e378467c8f4a9b6a51259996bb8bb763f78107eaf12f99501",
        strip_prefix = "github.com/json-iterator/go@v1.1.12",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/json-iterator/go/com_github_json_iterator_go-v1.1.12.zip",
            "http://ats.apps.svc/gomod/github.com/json-iterator/go/com_github_json_iterator_go-v1.1.12.zip",
            "https://cache.hawkingrei.com/gomod/github.com/json-iterator/go/com_github_json_iterator_go-v1.1.12.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/json-iterator/go/com_github_json_iterator_go-v1.1.12.zip",
        ],
    )
    go_repository(
        name = "com_github_jstemmer_go_junit_report",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jstemmer/go-junit-report",
        sha256 = "fbd2196e4a50a88f8c352f76325f4ba72338ecec7b6cb7535317ce9e3aa40284",
        strip_prefix = "github.com/jstemmer/go-junit-report@v0.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jstemmer/go-junit-report/com_github_jstemmer_go_junit_report-v0.9.1.zip",
            "http://ats.apps.svc/gomod/github.com/jstemmer/go-junit-report/com_github_jstemmer_go_junit_report-v0.9.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jstemmer/go-junit-report/com_github_jstemmer_go_junit_report-v0.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jstemmer/go-junit-report/com_github_jstemmer_go_junit_report-v0.9.1.zip",
        ],
    )
    go_repository(
        name = "com_github_julienschmidt_httprouter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/julienschmidt/httprouter",
        sha256 = "e457dccd7015f340664e3b8cfd41997471382da2f4a743ee55be539abc6ca1f9",
        strip_prefix = "github.com/julienschmidt/httprouter@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/julienschmidt/httprouter/com_github_julienschmidt_httprouter-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/julienschmidt/httprouter/com_github_julienschmidt_httprouter-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/julienschmidt/httprouter/com_github_julienschmidt_httprouter-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/julienschmidt/httprouter/com_github_julienschmidt_httprouter-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_julz_importas",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/julz/importas",
        sha256 = "6a1fda13a425f99630d39230e42e0ca218c08e2434611f804b75ac2f3c66c3a0",
        strip_prefix = "github.com/julz/importas@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/julz/importas/com_github_julz_importas-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/julz/importas/com_github_julz_importas-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/julz/importas/com_github_julz_importas-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/julz/importas/com_github_julz_importas-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_jung_kurt_gofpdf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/jung-kurt/gofpdf",
        sha256 = "f0fa70ade137185bbff2f016831a2a456eaadc8d14bc7bf24f0229211820c078",
        strip_prefix = "github.com/jung-kurt/gofpdf@v1.0.3-0.20190309125859-24315acbbda5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/jung-kurt/gofpdf/com_github_jung_kurt_gofpdf-v1.0.3-0.20190309125859-24315acbbda5.zip",
            "http://ats.apps.svc/gomod/github.com/jung-kurt/gofpdf/com_github_jung_kurt_gofpdf-v1.0.3-0.20190309125859-24315acbbda5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/jung-kurt/gofpdf/com_github_jung_kurt_gofpdf-v1.0.3-0.20190309125859-24315acbbda5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/jung-kurt/gofpdf/com_github_jung_kurt_gofpdf-v1.0.3-0.20190309125859-24315acbbda5.zip",
        ],
    )
    go_repository(
        name = "com_github_karamaru_alpha_copyloopvar",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/karamaru-alpha/copyloopvar",
        sha256 = "d7f1b636496b90d845cc5cdd95ee1aafe8ca4ea4c427b62fc0e322806011ab0d",
        strip_prefix = "github.com/karamaru-alpha/copyloopvar@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/karamaru-alpha/copyloopvar/com_github_karamaru_alpha_copyloopvar-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/karamaru-alpha/copyloopvar/com_github_karamaru_alpha_copyloopvar-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/karamaru-alpha/copyloopvar/com_github_karamaru_alpha_copyloopvar-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/karamaru-alpha/copyloopvar/com_github_karamaru_alpha_copyloopvar-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_blocks",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/blocks",
        sha256 = "bdc3d49ea54a2a2ef733ae701986be69fba7d735ae876ea736806e4f3ef00a8b",
        strip_prefix = "github.com/kataras/blocks@v0.0.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/blocks/com_github_kataras_blocks-v0.0.7.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/blocks/com_github_kataras_blocks-v0.0.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/blocks/com_github_kataras_blocks-v0.0.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/blocks/com_github_kataras_blocks-v0.0.7.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_golog",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/golog",
        sha256 = "3260bda850670a630c5a99d6501287096856efaf0126ab8f7a096b3b74f78b1c",
        strip_prefix = "github.com/kataras/golog@v0.1.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/golog/com_github_kataras_golog-v0.1.8.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/golog/com_github_kataras_golog-v0.1.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/golog/com_github_kataras_golog-v0.1.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/golog/com_github_kataras_golog-v0.1.8.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_iris_v12",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/iris/v12",
        sha256 = "1b1aa080adcd09d5ab95b4b2b371aad2c9e2a4fd96c98a9befc25db19da7c185",
        strip_prefix = "github.com/kataras/iris/v12@v12.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/iris/v12/com_github_kataras_iris_v12-v12.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/iris/v12/com_github_kataras_iris_v12-v12.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/iris/v12/com_github_kataras_iris_v12-v12.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/iris/v12/com_github_kataras_iris_v12-v12.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_pio",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/pio",
        sha256 = "95585375550ac1c80951f0394097f6d7faaeb51365b5be999259d966cedcd8e2",
        strip_prefix = "github.com/kataras/pio@v0.0.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/pio/com_github_kataras_pio-v0.0.11.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/pio/com_github_kataras_pio-v0.0.11.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/pio/com_github_kataras_pio-v0.0.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/pio/com_github_kataras_pio-v0.0.11.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_sitemap",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/sitemap",
        sha256 = "800ba5c5a28e512c18e3aaa7be50125db98c5be70b84107f3f90713ac2269ea0",
        strip_prefix = "github.com/kataras/sitemap@v0.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/sitemap/com_github_kataras_sitemap-v0.0.6.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/sitemap/com_github_kataras_sitemap-v0.0.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/sitemap/com_github_kataras_sitemap-v0.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/sitemap/com_github_kataras_sitemap-v0.0.6.zip",
        ],
    )
    go_repository(
        name = "com_github_kataras_tunnel",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kataras/tunnel",
        sha256 = "1ae8dcc9a6ca3f47c5f8b57767a08b0acd916eceef49c48aa9859547316db8e2",
        strip_prefix = "github.com/kataras/tunnel@v0.0.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kataras/tunnel/com_github_kataras_tunnel-v0.0.4.zip",
            "http://ats.apps.svc/gomod/github.com/kataras/tunnel/com_github_kataras_tunnel-v0.0.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kataras/tunnel/com_github_kataras_tunnel-v0.0.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kataras/tunnel/com_github_kataras_tunnel-v0.0.4.zip",
        ],
    )
    go_repository(
        name = "com_github_kballard_go_shellquote",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kballard/go-shellquote",
        sha256 = "ae4cb7b097dc4eb0c248dff00ed3bbf0f36984c4162ad1d615266084e58bd6cc",
        strip_prefix = "github.com/kballard/go-shellquote@v0.0.0-20180428030007-95032a82bc51",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kballard/go-shellquote/com_github_kballard_go_shellquote-v0.0.0-20180428030007-95032a82bc51.zip",
            "http://ats.apps.svc/gomod/github.com/kballard/go-shellquote/com_github_kballard_go_shellquote-v0.0.0-20180428030007-95032a82bc51.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kballard/go-shellquote/com_github_kballard_go_shellquote-v0.0.0-20180428030007-95032a82bc51.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kballard/go-shellquote/com_github_kballard_go_shellquote-v0.0.0-20180428030007-95032a82bc51.zip",
        ],
    )
    go_repository(
        name = "com_github_kimmachinegun_automemlimit",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/KimMachineGun/automemlimit",
        sha256 = "fb03ca71f809b89d513c0cbb5ad7b05c1268e220401298958cb970b76027e4ca",
        strip_prefix = "github.com/KimMachineGun/automemlimit@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/KimMachineGun/automemlimit/com_github_kimmachinegun_automemlimit-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/KimMachineGun/automemlimit/com_github_kimmachinegun_automemlimit-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/KimMachineGun/automemlimit/com_github_kimmachinegun_automemlimit-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/KimMachineGun/automemlimit/com_github_kimmachinegun_automemlimit-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_kisielk_errcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kisielk/errcheck",
        patch_args = ["-p1"],
        patches = [
            "//build/patches:com_github_kisielk_errcheck.patch",
        ],
        sha256 = "a8b10cd38fff25149d4867e68d94eaa1284f537a11da6af2c7119cc4128b3f8d",
        strip_prefix = "github.com/kisielk/errcheck@v1.9.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kisielk/errcheck/com_github_kisielk_errcheck-v1.9.0.zip",
            "http://ats.apps.svc/gomod/github.com/kisielk/errcheck/com_github_kisielk_errcheck-v1.9.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kisielk/errcheck/com_github_kisielk_errcheck-v1.9.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kisielk/errcheck/com_github_kisielk_errcheck-v1.9.0.zip",
        ],
    )
    go_repository(
        name = "com_github_kisielk_gotool",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kisielk/gotool",
        sha256 = "089dbba6e3aa09944fdb40d72acc86694e8bdde01cfc0f40fe0248309eb80a3f",
        strip_prefix = "github.com/kisielk/gotool@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kisielk/gotool/com_github_kisielk_gotool-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/kisielk/gotool/com_github_kisielk_gotool-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kisielk/gotool/com_github_kisielk_gotool-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kisielk/gotool/com_github_kisielk_gotool-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_kkhaike_contextcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kkHAIKE/contextcheck",
        sha256 = "a919919cb8607007f7213ea32975a1f86d094388a758ff1077a3ba449c49cfe5",
        strip_prefix = "github.com/kkHAIKE/contextcheck@v1.1.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kkHAIKE/contextcheck/com_github_kkhaike_contextcheck-v1.1.6.zip",
            "http://ats.apps.svc/gomod/github.com/kkHAIKE/contextcheck/com_github_kkhaike_contextcheck-v1.1.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kkHAIKE/contextcheck/com_github_kkhaike_contextcheck-v1.1.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kkHAIKE/contextcheck/com_github_kkhaike_contextcheck-v1.1.6.zip",
        ],
    )
    go_repository(
        name = "com_github_klauspost_asmfmt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/klauspost/asmfmt",
        sha256 = "fa6a350a8677a77e0dbf3664c6baf23aab5c0b60a64b8f3c00299da5d279021f",
        strip_prefix = "github.com/klauspost/asmfmt@v1.3.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/klauspost/asmfmt/com_github_klauspost_asmfmt-v1.3.2.zip",
            "http://ats.apps.svc/gomod/github.com/klauspost/asmfmt/com_github_klauspost_asmfmt-v1.3.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/klauspost/asmfmt/com_github_klauspost_asmfmt-v1.3.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/klauspost/asmfmt/com_github_klauspost_asmfmt-v1.3.2.zip",
        ],
    )
    go_repository(
        name = "com_github_klauspost_compress",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/klauspost/compress",
        sha256 = "c4679e4cbc820a21758199d985be754abf5eb2a38e6f1de95cd70b2e7ef06905",
        strip_prefix = "github.com/klauspost/compress@v1.18.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/klauspost/compress/com_github_klauspost_compress-v1.18.0.zip",
            "http://ats.apps.svc/gomod/github.com/klauspost/compress/com_github_klauspost_compress-v1.18.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/klauspost/compress/com_github_klauspost_compress-v1.18.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/klauspost/compress/com_github_klauspost_compress-v1.18.0.zip",
        ],
    )
    go_repository(
        name = "com_github_klauspost_cpuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/klauspost/cpuid",
        sha256 = "f61266e43d5c247fdb55d843e2d93974717c1052cba9f331b181f60c4cf687d9",
        strip_prefix = "github.com/klauspost/cpuid@v1.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/klauspost/cpuid/com_github_klauspost_cpuid-v1.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/klauspost/cpuid/com_github_klauspost_cpuid-v1.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/klauspost/cpuid/com_github_klauspost_cpuid-v1.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/klauspost/cpuid/com_github_klauspost_cpuid-v1.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_klauspost_cpuid_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/klauspost/cpuid/v2",
        sha256 = "415f9c5ed79ee9b123cf13923a9ab86a34d1f7d417c02b2e00db0d8e34fda037",
        strip_prefix = "github.com/klauspost/cpuid/v2@v2.2.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/klauspost/cpuid/v2/com_github_klauspost_cpuid_v2-v2.2.7.zip",
            "http://ats.apps.svc/gomod/github.com/klauspost/cpuid/v2/com_github_klauspost_cpuid_v2-v2.2.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/klauspost/cpuid/v2/com_github_klauspost_cpuid_v2-v2.2.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/klauspost/cpuid/v2/com_github_klauspost_cpuid_v2-v2.2.7.zip",
        ],
    )
    go_repository(
        name = "com_github_kolo_xmlrpc",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kolo/xmlrpc",
        sha256 = "310742360a864798a1bfce6db8604263574c0be502670c8bfedeab8fcbe9d191",
        strip_prefix = "github.com/kolo/xmlrpc@v0.0.0-20220921171641-a4b6fa1dd06b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kolo/xmlrpc/com_github_kolo_xmlrpc-v0.0.0-20220921171641-a4b6fa1dd06b.zip",
            "http://ats.apps.svc/gomod/github.com/kolo/xmlrpc/com_github_kolo_xmlrpc-v0.0.0-20220921171641-a4b6fa1dd06b.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kolo/xmlrpc/com_github_kolo_xmlrpc-v0.0.0-20220921171641-a4b6fa1dd06b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kolo/xmlrpc/com_github_kolo_xmlrpc-v0.0.0-20220921171641-a4b6fa1dd06b.zip",
        ],
    )
    go_repository(
        name = "com_github_konsorten_go_windows_terminal_sequences",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/konsorten/go-windows-terminal-sequences",
        sha256 = "7fd0273fc0855ed08172c150f756e708d6e43c4a6d52ca4939a8b43d03356091",
        strip_prefix = "github.com/konsorten/go-windows-terminal-sequences@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/konsorten/go-windows-terminal-sequences/com_github_konsorten_go_windows_terminal_sequences-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/konsorten/go-windows-terminal-sequences/com_github_konsorten_go_windows_terminal_sequences-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/konsorten/go-windows-terminal-sequences/com_github_konsorten_go_windows_terminal_sequences-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/konsorten/go-windows-terminal-sequences/com_github_konsorten_go_windows_terminal_sequences-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_kr_pretty",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kr/pretty",
        sha256 = "ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc",
        strip_prefix = "github.com/kr/pretty@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kr/pretty/com_github_kr_pretty-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/kr/pretty/com_github_kr_pretty-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kr/pretty/com_github_kr_pretty-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kr/pretty/com_github_kr_pretty-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_kr_pty",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kr/pty",
        sha256 = "10474d7a875cbd2b9d74c9bb8fb99264b7863f204c7610607797ff18d580bf00",
        strip_prefix = "github.com/kr/pty@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kr/pty/com_github_kr_pty-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/kr/pty/com_github_kr_pty-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kr/pty/com_github_kr_pty-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kr/pty/com_github_kr_pty-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_kr_text",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kr/text",
        sha256 = "368eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4",
        strip_prefix = "github.com/kr/text@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kr/text/com_github_kr_text-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/kr/text/com_github_kr_text-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kr/text/com_github_kr_text-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kr/text/com_github_kr_text-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ks3sdklib_aws_sdk_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ks3sdklib/aws-sdk-go",
        sha256 = "1edfac4a072a0180b308ddc1a9e96d51407e2e66573938e14e056ba6fef5bddb",
        strip_prefix = "github.com/ks3sdklib/aws-sdk-go@v1.2.9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ks3sdklib/aws-sdk-go/com_github_ks3sdklib_aws_sdk_go-v1.2.9.zip",
            "http://ats.apps.svc/gomod/github.com/ks3sdklib/aws-sdk-go/com_github_ks3sdklib_aws_sdk_go-v1.2.9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ks3sdklib/aws-sdk-go/com_github_ks3sdklib_aws_sdk_go-v1.2.9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ks3sdklib/aws-sdk-go/com_github_ks3sdklib_aws_sdk_go-v1.2.9.zip",
        ],
    )
    go_repository(
        name = "com_github_kulti_thelper",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kulti/thelper",
        sha256 = "df0f6ef115c192c9949fd671f05a9660b6c3f6b1bb8de3fb4a5fc74632c92676",
        strip_prefix = "github.com/kulti/thelper@v0.6.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kulti/thelper/com_github_kulti_thelper-v0.6.3.zip",
            "http://ats.apps.svc/gomod/github.com/kulti/thelper/com_github_kulti_thelper-v0.6.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kulti/thelper/com_github_kulti_thelper-v0.6.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kulti/thelper/com_github_kulti_thelper-v0.6.3.zip",
        ],
    )
    go_repository(
        name = "com_github_kunwardeep_paralleltest",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kunwardeep/paralleltest",
        sha256 = "b27fd73eadf52d3b6385eafda4fcdab0f4037d8f6cd2623b9209122dcde88a7a",
        strip_prefix = "github.com/kunwardeep/paralleltest@v1.0.14",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kunwardeep/paralleltest/com_github_kunwardeep_paralleltest-v1.0.14.zip",
            "http://ats.apps.svc/gomod/github.com/kunwardeep/paralleltest/com_github_kunwardeep_paralleltest-v1.0.14.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kunwardeep/paralleltest/com_github_kunwardeep_paralleltest-v1.0.14.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kunwardeep/paralleltest/com_github_kunwardeep_paralleltest-v1.0.14.zip",
        ],
    )
    go_repository(
        name = "com_github_kylelemons_godebug",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/kylelemons/godebug",
        sha256 = "dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13",
        strip_prefix = "github.com/kylelemons/godebug@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/kylelemons/godebug/com_github_kylelemons_godebug-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/kylelemons/godebug/com_github_kylelemons_godebug-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/kylelemons/godebug/com_github_kylelemons_godebug-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/kylelemons/godebug/com_github_kylelemons_godebug-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_labstack_echo_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/labstack/echo/v4",
        sha256 = "a3fc254d25ecedac09219b74725f6ae3dd9234951c7bd14a18b0f1ce3077f059",
        strip_prefix = "github.com/labstack/echo/v4@v4.10.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/labstack/echo/v4/com_github_labstack_echo_v4-v4.10.0.zip",
            "http://ats.apps.svc/gomod/github.com/labstack/echo/v4/com_github_labstack_echo_v4-v4.10.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/labstack/echo/v4/com_github_labstack_echo_v4-v4.10.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/labstack/echo/v4/com_github_labstack_echo_v4-v4.10.0.zip",
        ],
    )
    go_repository(
        name = "com_github_labstack_gommon",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/labstack/gommon",
        sha256 = "ecb8222666a0058337912bbddb2c3e9ba1f60b356248619f6936eec5bfec640b",
        strip_prefix = "github.com/labstack/gommon@v0.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/labstack/gommon/com_github_labstack_gommon-v0.4.0.zip",
            "http://ats.apps.svc/gomod/github.com/labstack/gommon/com_github_labstack_gommon-v0.4.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/labstack/gommon/com_github_labstack_gommon-v0.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/labstack/gommon/com_github_labstack_gommon-v0.4.0.zip",
        ],
    )
    go_repository(
        name = "com_github_lasiar_canonicalheader",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lasiar/canonicalheader",
        sha256 = "62dc50594ced395442904074d473f24e425a253f48dad108974835e2c98d8701",
        strip_prefix = "github.com/lasiar/canonicalheader@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lasiar/canonicalheader/com_github_lasiar_canonicalheader-v1.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/lasiar/canonicalheader/com_github_lasiar_canonicalheader-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lasiar/canonicalheader/com_github_lasiar_canonicalheader-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lasiar/canonicalheader/com_github_lasiar_canonicalheader-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_ldez_exptostd",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ldez/exptostd",
        sha256 = "3c18b8ab3c2b8487153bd21d8b541f065750414bd4d681c3ed65fd2dc1785dae",
        strip_prefix = "github.com/ldez/exptostd@v0.4.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ldez/exptostd/com_github_ldez_exptostd-v0.4.4.zip",
            "http://ats.apps.svc/gomod/github.com/ldez/exptostd/com_github_ldez_exptostd-v0.4.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ldez/exptostd/com_github_ldez_exptostd-v0.4.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ldez/exptostd/com_github_ldez_exptostd-v0.4.4.zip",
        ],
    )
    go_repository(
        name = "com_github_ldez_gomoddirectives",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ldez/gomoddirectives",
        sha256 = "309a019b3277d6338b69741e414e809c891fb4427b8a3efe7e0c4fb279ece101",
        strip_prefix = "github.com/ldez/gomoddirectives@v0.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ldez/gomoddirectives/com_github_ldez_gomoddirectives-v0.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/ldez/gomoddirectives/com_github_ldez_gomoddirectives-v0.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ldez/gomoddirectives/com_github_ldez_gomoddirectives-v0.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ldez/gomoddirectives/com_github_ldez_gomoddirectives-v0.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ldez_grignotin",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ldez/grignotin",
        sha256 = "b3cc33179be60f40b81f5032d61643474ebb12bdf10b4ac052e293e01ca8744e",
        strip_prefix = "github.com/ldez/grignotin@v0.9.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ldez/grignotin/com_github_ldez_grignotin-v0.9.0.zip",
            "http://ats.apps.svc/gomod/github.com/ldez/grignotin/com_github_ldez_grignotin-v0.9.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ldez/grignotin/com_github_ldez_grignotin-v0.9.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ldez/grignotin/com_github_ldez_grignotin-v0.9.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ldez_tagliatelle",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ldez/tagliatelle",
        sha256 = "3b33ada48dbfc1d4edadb7658886109237b5b407f05cbb62dfe97d910f85d165",
        strip_prefix = "github.com/ldez/tagliatelle@v0.7.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ldez/tagliatelle/com_github_ldez_tagliatelle-v0.7.1.zip",
            "http://ats.apps.svc/gomod/github.com/ldez/tagliatelle/com_github_ldez_tagliatelle-v0.7.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ldez/tagliatelle/com_github_ldez_tagliatelle-v0.7.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ldez/tagliatelle/com_github_ldez_tagliatelle-v0.7.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ldez_usetesting",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ldez/usetesting",
        sha256 = "622179db8defce583436200d5392b8682f7be1016d3e8f8b4607832f4a591a35",
        strip_prefix = "github.com/ldez/usetesting@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ldez/usetesting/com_github_ldez_usetesting-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/ldez/usetesting/com_github_ldez_usetesting-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ldez/usetesting/com_github_ldez_usetesting-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ldez/usetesting/com_github_ldez_usetesting-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_leodido_go_urn",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/leodido/go-urn",
        sha256 = "8ae6e756f0e919a551e447f286491c08ca36ceaf415c2dde395fd79c1a408d1a",
        strip_prefix = "github.com/leodido/go-urn@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/leodido/go-urn/com_github_leodido_go_urn-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/leodido/go-urn/com_github_leodido_go_urn-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/leodido/go-urn/com_github_leodido_go_urn-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/leodido/go-urn/com_github_leodido_go_urn-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_leonklingele_grouper",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/leonklingele/grouper",
        sha256 = "8e6018a6009b21d0e260a4a7afd281a6b7d97ade749319ae42e493d2cf5a5cbc",
        strip_prefix = "github.com/leonklingele/grouper@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/leonklingele/grouper/com_github_leonklingele_grouper-v1.1.2.zip",
            "http://ats.apps.svc/gomod/github.com/leonklingele/grouper/com_github_leonklingele_grouper-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/leonklingele/grouper/com_github_leonklingele_grouper-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/leonklingele/grouper/com_github_leonklingele_grouper-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_blackmagic",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/blackmagic",
        sha256 = "2baa5f21e1db4781a11d0ba2fbe8e71323c78875034da61687d80f47ae9c78ce",
        strip_prefix = "github.com/lestrrat-go/blackmagic@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/blackmagic/com_github_lestrrat_go_blackmagic-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/blackmagic/com_github_lestrrat_go_blackmagic-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/blackmagic/com_github_lestrrat_go_blackmagic-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/blackmagic/com_github_lestrrat_go_blackmagic-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_httpcc",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/httpcc",
        sha256 = "d75132f805ea5cf6275d9af02a5ff3c116ad92ac7fc28e2a22b8fd2e029a3f4c",
        strip_prefix = "github.com/lestrrat-go/httpcc@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/httpcc/com_github_lestrrat_go_httpcc-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/httpcc/com_github_lestrrat_go_httpcc-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/httpcc/com_github_lestrrat_go_httpcc-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/httpcc/com_github_lestrrat_go_httpcc-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_httprc",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/httprc",
        sha256 = "b5ec122596da8970869d3b41a1bc901a440c66a906bbd2fcbe2a19e8728787d7",
        strip_prefix = "github.com/lestrrat-go/httprc@v1.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/httprc/com_github_lestrrat_go_httprc-v1.0.5.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/httprc/com_github_lestrrat_go_httprc-v1.0.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/httprc/com_github_lestrrat_go_httprc-v1.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/httprc/com_github_lestrrat_go_httprc-v1.0.5.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_iter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/iter",
        sha256 = "991bf0aee428fc1a2c01d548e2c7996dc26871dd0b359c062dfc07b1fb137572",
        strip_prefix = "github.com/lestrrat-go/iter@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/iter/com_github_lestrrat_go_iter-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/iter/com_github_lestrrat_go_iter-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/iter/com_github_lestrrat_go_iter-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/iter/com_github_lestrrat_go_iter-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_jwx_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/jwx/v2",
        sha256 = "f49d9cb1482cbd4ed113d8fa1c3f197df5ba498dd461641123cff0337e030af2",
        strip_prefix = "github.com/lestrrat-go/jwx/v2@v2.0.21",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/jwx/v2/com_github_lestrrat_go_jwx_v2-v2.0.21.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/jwx/v2/com_github_lestrrat_go_jwx_v2-v2.0.21.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/jwx/v2/com_github_lestrrat_go_jwx_v2-v2.0.21.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/jwx/v2/com_github_lestrrat_go_jwx_v2-v2.0.21.zip",
        ],
    )
    go_repository(
        name = "com_github_lestrrat_go_option",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lestrrat-go/option",
        sha256 = "3e5614e160680053e07e4970e825e694c2a917741e735ab4d435a396b739ae78",
        strip_prefix = "github.com/lestrrat-go/option@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lestrrat-go/option/com_github_lestrrat_go_option-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/lestrrat-go/option/com_github_lestrrat_go_option-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lestrrat-go/option/com_github_lestrrat_go_option-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lestrrat-go/option/com_github_lestrrat_go_option-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_linode_linodego",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/linode/linodego",
        sha256 = "af21149264f65f5a0383ee0a109e8ef1e4f5db95f951d657cb923b0b4f771d4a",
        strip_prefix = "github.com/linode/linodego@v1.27.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/linode/linodego/com_github_linode_linodego-v1.27.1.zip",
            "http://ats.apps.svc/gomod/github.com/linode/linodego/com_github_linode_linodego-v1.27.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/linode/linodego/com_github_linode_linodego-v1.27.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/linode/linodego/com_github_linode_linodego-v1.27.1.zip",
        ],
    )
    go_repository(
        name = "com_github_lucasb_eyer_go_colorful",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lucasb-eyer/go-colorful",
        sha256 = "78d5d0e0737f0f54bbed77b6dfa847d8c871bed2668a9dc44328c7c3411ada10",
        strip_prefix = "github.com/lucasb-eyer/go-colorful@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lucasb-eyer/go-colorful/com_github_lucasb_eyer_go_colorful-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/lucasb-eyer/go-colorful/com_github_lucasb_eyer_go_colorful-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lucasb-eyer/go-colorful/com_github_lucasb_eyer_go_colorful-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lucasb-eyer/go-colorful/com_github_lucasb_eyer_go_colorful-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_lufia_plan9stats",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/lufia/plan9stats",
        sha256 = "7163852e02f12aff5db9b5250690f3a177cdcdb514f2afc8cfb38a6396a950c1",
        strip_prefix = "github.com/lufia/plan9stats@v0.0.0-20230326075908-cb1d2100619a",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/lufia/plan9stats/com_github_lufia_plan9stats-v0.0.0-20230326075908-cb1d2100619a.zip",
            "http://ats.apps.svc/gomod/github.com/lufia/plan9stats/com_github_lufia_plan9stats-v0.0.0-20230326075908-cb1d2100619a.zip",
            "https://cache.hawkingrei.com/gomod/github.com/lufia/plan9stats/com_github_lufia_plan9stats-v0.0.0-20230326075908-cb1d2100619a.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/lufia/plan9stats/com_github_lufia_plan9stats-v0.0.0-20230326075908-cb1d2100619a.zip",
        ],
    )
    go_repository(
        name = "com_github_macabu_inamedparam",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/macabu/inamedparam",
        sha256 = "af152522c00730607446f91d1ccf059e734714691dc3040567d7a4655a5270e6",
        strip_prefix = "github.com/macabu/inamedparam@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/macabu/inamedparam/com_github_macabu_inamedparam-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/macabu/inamedparam/com_github_macabu_inamedparam-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/macabu/inamedparam/com_github_macabu_inamedparam-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/macabu/inamedparam/com_github_macabu_inamedparam-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_magiconair_properties",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/magiconair/properties",
        sha256 = "649dd0dac8fa6d7f2d5e6d1e7fe4a57ecb6c05346c8f6f15968dd66ebaf7212a",
        strip_prefix = "github.com/magiconair/properties@v1.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/magiconair/properties/com_github_magiconair_properties-v1.8.6.zip",
            "http://ats.apps.svc/gomod/github.com/magiconair/properties/com_github_magiconair_properties-v1.8.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/magiconair/properties/com_github_magiconair_properties-v1.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/magiconair/properties/com_github_magiconair_properties-v1.8.6.zip",
        ],
    )
    go_repository(
        name = "com_github_mailgun_raymond_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mailgun/raymond/v2",
        sha256 = "9ff5de08464b1bc2d0a0dd6f4e7cadd20888e5ad39bf2acea09652750b1e92e0",
        strip_prefix = "github.com/mailgun/raymond/v2@v2.0.48",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mailgun/raymond/v2/com_github_mailgun_raymond_v2-v2.0.48.zip",
            "http://ats.apps.svc/gomod/github.com/mailgun/raymond/v2/com_github_mailgun_raymond_v2-v2.0.48.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mailgun/raymond/v2/com_github_mailgun_raymond_v2-v2.0.48.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mailgun/raymond/v2/com_github_mailgun_raymond_v2-v2.0.48.zip",
        ],
    )
    go_repository(
        name = "com_github_mailru_easyjson",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mailru/easyjson",
        sha256 = "139387981a220d499c9f47cece42a2002f105e4ee3ab9c74188a7fb8a9be711e",
        strip_prefix = "github.com/mailru/easyjson@v0.7.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mailru/easyjson/com_github_mailru_easyjson-v0.7.7.zip",
            "http://ats.apps.svc/gomod/github.com/mailru/easyjson/com_github_mailru_easyjson-v0.7.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mailru/easyjson/com_github_mailru_easyjson-v0.7.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mailru/easyjson/com_github_mailru_easyjson-v0.7.7.zip",
        ],
    )
    go_repository(
        name = "com_github_manuelarte_embeddedstructfieldcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/manuelarte/embeddedstructfieldcheck",
        sha256 = "12f35b5f6c59c7238f2da5e9f93cf36c5eef1a46a2a970b84ec100fff5e94cfd",
        strip_prefix = "github.com/manuelarte/embeddedstructfieldcheck@v0.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/manuelarte/embeddedstructfieldcheck/com_github_manuelarte_embeddedstructfieldcheck-v0.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/manuelarte/embeddedstructfieldcheck/com_github_manuelarte_embeddedstructfieldcheck-v0.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/manuelarte/embeddedstructfieldcheck/com_github_manuelarte_embeddedstructfieldcheck-v0.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/manuelarte/embeddedstructfieldcheck/com_github_manuelarte_embeddedstructfieldcheck-v0.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_manuelarte_funcorder",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/manuelarte/funcorder",
        sha256 = "1f040c58b2c8149fba57590f42709c32e118724fe365b58954f71aa957c80ee4",
        strip_prefix = "github.com/manuelarte/funcorder@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/manuelarte/funcorder/com_github_manuelarte_funcorder-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/manuelarte/funcorder/com_github_manuelarte_funcorder-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/manuelarte/funcorder/com_github_manuelarte_funcorder-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/manuelarte/funcorder/com_github_manuelarte_funcorder-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_maratori_testableexamples",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/maratori/testableexamples",
        sha256 = "c4605f4f40f71448ab16bdd914a8c35903f3e6a65f7578b66e07456111f9f433",
        strip_prefix = "github.com/maratori/testableexamples@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/maratori/testableexamples/com_github_maratori_testableexamples-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/maratori/testableexamples/com_github_maratori_testableexamples-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/maratori/testableexamples/com_github_maratori_testableexamples-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/maratori/testableexamples/com_github_maratori_testableexamples-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_maratori_testpackage",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/maratori/testpackage",
        sha256 = "72931ea874f81055da8999ab8f383967a18c705d3b93259a35fe4a9dc4feb21c",
        strip_prefix = "github.com/maratori/testpackage@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/maratori/testpackage/com_github_maratori_testpackage-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/maratori/testpackage/com_github_maratori_testpackage-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/maratori/testpackage/com_github_maratori_testpackage-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/maratori/testpackage/com_github_maratori_testpackage-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_masterminds_goutils",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Masterminds/goutils",
        sha256 = "ef8778a20c37e98a92e3b1db5ab027cc201743a2f5bfb26ba228bf0515e20b48",
        strip_prefix = "github.com/Masterminds/goutils@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Masterminds/goutils/com_github_masterminds_goutils-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/Masterminds/goutils/com_github_masterminds_goutils-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Masterminds/goutils/com_github_masterminds_goutils-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Masterminds/goutils/com_github_masterminds_goutils-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_masterminds_semver",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Masterminds/semver",
        sha256 = "15f6b54a695c15ffb205d5719e5ed50fab9ba9a739e1b4bdf3a0a319f51a7202",
        strip_prefix = "github.com/Masterminds/semver@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Masterminds/semver/com_github_masterminds_semver-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/Masterminds/semver/com_github_masterminds_semver-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Masterminds/semver/com_github_masterminds_semver-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Masterminds/semver/com_github_masterminds_semver-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_masterminds_semver_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Masterminds/semver/v3",
        sha256 = "e1b204876a92f8aae3488670395d8ee0813fc775cd883727f47768e9040905eb",
        strip_prefix = "github.com/Masterminds/semver/v3@v3.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Masterminds/semver/v3/com_github_masterminds_semver_v3-v3.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/Masterminds/semver/v3/com_github_masterminds_semver_v3-v3.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Masterminds/semver/v3/com_github_masterminds_semver_v3-v3.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Masterminds/semver/v3/com_github_masterminds_semver_v3-v3.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_masterminds_sprig_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Masterminds/sprig/v3",
        sha256 = "be8dcfe2b278d11b946caee75661e0ce3c2592733963029fb9950e67dcd92579",
        strip_prefix = "github.com/Masterminds/sprig/v3@v3.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Masterminds/sprig/v3/com_github_masterminds_sprig_v3-v3.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/Masterminds/sprig/v3/com_github_masterminds_sprig_v3-v3.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Masterminds/sprig/v3/com_github_masterminds_sprig_v3-v3.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Masterminds/sprig/v3/com_github_masterminds_sprig_v3-v3.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_matoous_godox",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/matoous/godox",
        sha256 = "ece44439a68a7c1027e80d3f54dcea79b45ce2fdfb8e819a05728df75e7d7177",
        strip_prefix = "github.com/matoous/godox@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/matoous/godox/com_github_matoous_godox-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/matoous/godox/com_github_matoous_godox-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/matoous/godox/com_github_matoous_godox-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/matoous/godox/com_github_matoous_godox-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_mattn_go_colorable",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mattn/go-colorable",
        sha256 = "5e0e7925a070bb5bd11b4097e1a7b608167f0217ee83901b44c135f6e5e85c78",
        strip_prefix = "github.com/mattn/go-colorable@v0.1.14",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mattn/go-colorable/com_github_mattn_go_colorable-v0.1.14.zip",
            "http://ats.apps.svc/gomod/github.com/mattn/go-colorable/com_github_mattn_go_colorable-v0.1.14.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mattn/go-colorable/com_github_mattn_go_colorable-v0.1.14.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mattn/go-colorable/com_github_mattn_go_colorable-v0.1.14.zip",
        ],
    )
    go_repository(
        name = "com_github_mattn_go_isatty",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mattn/go-isatty",
        sha256 = "f2d5f89ca451577e17464b9bb596dc0d0ecececb5eaa63622c41b57cd0b7b8cc",
        strip_prefix = "github.com/mattn/go-isatty@v0.0.20",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mattn/go-isatty/com_github_mattn_go_isatty-v0.0.20.zip",
            "http://ats.apps.svc/gomod/github.com/mattn/go-isatty/com_github_mattn_go_isatty-v0.0.20.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mattn/go-isatty/com_github_mattn_go_isatty-v0.0.20.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mattn/go-isatty/com_github_mattn_go_isatty-v0.0.20.zip",
        ],
    )
    go_repository(
        name = "com_github_mattn_go_runewidth",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mattn/go-runewidth",
        sha256 = "179d2d900c76ee3560fbeda60d0237a3be6acb734d0cb7423b55e5ccb0cedbca",
        strip_prefix = "github.com/mattn/go-runewidth@v0.0.16",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mattn/go-runewidth/com_github_mattn_go_runewidth-v0.0.16.zip",
            "http://ats.apps.svc/gomod/github.com/mattn/go-runewidth/com_github_mattn_go_runewidth-v0.0.16.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mattn/go-runewidth/com_github_mattn_go_runewidth-v0.0.16.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mattn/go-runewidth/com_github_mattn_go_runewidth-v0.0.16.zip",
        ],
    )
    go_repository(
        name = "com_github_mattn_go_sqlite3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mattn/go-sqlite3",
        sha256 = "0114d2df439ddeb03eef49a4bf2cc8fb69665c0d76494463cafa7d189a16e0f9",
        strip_prefix = "github.com/mattn/go-sqlite3@v1.14.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mattn/go-sqlite3/com_github_mattn_go_sqlite3-v1.14.15.zip",
            "http://ats.apps.svc/gomod/github.com/mattn/go-sqlite3/com_github_mattn_go_sqlite3-v1.14.15.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mattn/go-sqlite3/com_github_mattn_go_sqlite3-v1.14.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mattn/go-sqlite3/com_github_mattn_go_sqlite3-v1.14.15.zip",
        ],
    )
    go_repository(
        name = "com_github_matttproud_golang_protobuf_extensions",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/matttproud/golang_protobuf_extensions",
        sha256 = "232df417d378e10bb1dcdd533c493647a247f62d9fe2b13c636d9647ff13384a",
        strip_prefix = "github.com/matttproud/golang_protobuf_extensions@v1.0.2-0.20181231171920-c182affec369",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/matttproud/golang_protobuf_extensions/com_github_matttproud_golang_protobuf_extensions-v1.0.2-0.20181231171920-c182affec369.zip",
            "http://ats.apps.svc/gomod/github.com/matttproud/golang_protobuf_extensions/com_github_matttproud_golang_protobuf_extensions-v1.0.2-0.20181231171920-c182affec369.zip",
            "https://cache.hawkingrei.com/gomod/github.com/matttproud/golang_protobuf_extensions/com_github_matttproud_golang_protobuf_extensions-v1.0.2-0.20181231171920-c182affec369.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/matttproud/golang_protobuf_extensions/com_github_matttproud_golang_protobuf_extensions-v1.0.2-0.20181231171920-c182affec369.zip",
        ],
    )
    go_repository(
        name = "com_github_mgechev_dots",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mgechev/dots",
        sha256 = "e06072d98d478872a547d5331567f9d72fc059fe5da6409687a4c194d611bae1",
        strip_prefix = "github.com/mgechev/dots@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mgechev/dots/com_github_mgechev_dots-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/mgechev/dots/com_github_mgechev_dots-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mgechev/dots/com_github_mgechev_dots-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mgechev/dots/com_github_mgechev_dots-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_mgechev_revive",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mgechev/revive",
        sha256 = "fdd3cb85a75d3278df0bfaad99067b75e3984825473f0af76dcd36f3f922ca77",
        strip_prefix = "github.com/mgechev/revive@v1.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mgechev/revive/com_github_mgechev_revive-v1.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/mgechev/revive/com_github_mgechev_revive-v1.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mgechev/revive/com_github_mgechev_revive-v1.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mgechev/revive/com_github_mgechev_revive-v1.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_microcosm_cc_bluemonday",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/microcosm-cc/bluemonday",
        sha256 = "d720813b959b6713e000407778188cdc3b88cf3235a3dfda6543d7c5e748da6d",
        strip_prefix = "github.com/microcosm-cc/bluemonday@v1.0.23",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/microcosm-cc/bluemonday/com_github_microcosm_cc_bluemonday-v1.0.23.zip",
            "http://ats.apps.svc/gomod/github.com/microcosm-cc/bluemonday/com_github_microcosm_cc_bluemonday-v1.0.23.zip",
            "https://cache.hawkingrei.com/gomod/github.com/microcosm-cc/bluemonday/com_github_microcosm_cc_bluemonday-v1.0.23.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/microcosm-cc/bluemonday/com_github_microcosm_cc_bluemonday-v1.0.23.zip",
        ],
    )
    go_repository(
        name = "com_github_microsoft_go_winio",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Microsoft/go-winio",
        sha256 = "fdfec88b9eb61895ab39ed3a6181d99d78366638f86a609170d76417ba018f53",
        strip_prefix = "github.com/Microsoft/go-winio@v0.6.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Microsoft/go-winio/com_github_microsoft_go_winio-v0.6.1.zip",
            "http://ats.apps.svc/gomod/github.com/Microsoft/go-winio/com_github_microsoft_go_winio-v0.6.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Microsoft/go-winio/com_github_microsoft_go_winio-v0.6.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Microsoft/go-winio/com_github_microsoft_go_winio-v0.6.1.zip",
        ],
    )
    go_repository(
        name = "com_github_miekg_dns",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/miekg/dns",
        sha256 = "179bd419d011fd90802355756f59fff70ddf9a5886a4db6336a6d05783552b16",
        strip_prefix = "github.com/miekg/dns@v1.1.58",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/miekg/dns/com_github_miekg_dns-v1.1.58.zip",
            "http://ats.apps.svc/gomod/github.com/miekg/dns/com_github_miekg_dns-v1.1.58.zip",
            "https://cache.hawkingrei.com/gomod/github.com/miekg/dns/com_github_miekg_dns-v1.1.58.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/miekg/dns/com_github_miekg_dns-v1.1.58.zip",
        ],
    )
    go_repository(
        name = "com_github_minio_asm2plan9s",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/minio/asm2plan9s",
        sha256 = "39a2e28284764fd5423247d7469875046d0c8c4c2773333abf1c544197e9d946",
        strip_prefix = "github.com/minio/asm2plan9s@v0.0.0-20200509001527-cdd76441f9d8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/minio/asm2plan9s/com_github_minio_asm2plan9s-v0.0.0-20200509001527-cdd76441f9d8.zip",
            "http://ats.apps.svc/gomod/github.com/minio/asm2plan9s/com_github_minio_asm2plan9s-v0.0.0-20200509001527-cdd76441f9d8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/minio/asm2plan9s/com_github_minio_asm2plan9s-v0.0.0-20200509001527-cdd76441f9d8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/minio/asm2plan9s/com_github_minio_asm2plan9s-v0.0.0-20200509001527-cdd76441f9d8.zip",
        ],
    )
    go_repository(
        name = "com_github_minio_c2goasm",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/minio/c2goasm",
        sha256 = "04367ddf0fc5cd0f293e2c4f1acefb131b572539d88b5804d92efc905eb718b5",
        strip_prefix = "github.com/minio/c2goasm@v0.0.0-20190812172519-36a3d3bbc4f3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/minio/c2goasm/com_github_minio_c2goasm-v0.0.0-20190812172519-36a3d3bbc4f3.zip",
            "http://ats.apps.svc/gomod/github.com/minio/c2goasm/com_github_minio_c2goasm-v0.0.0-20190812172519-36a3d3bbc4f3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/minio/c2goasm/com_github_minio_c2goasm-v0.0.0-20190812172519-36a3d3bbc4f3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/minio/c2goasm/com_github_minio_c2goasm-v0.0.0-20190812172519-36a3d3bbc4f3.zip",
        ],
    )
    go_repository(
        name = "com_github_mitchellh_copystructure",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mitchellh/copystructure",
        sha256 = "4a2c9eb367a7781864e8edbd3b11781897766bcf6120f77a717d54a575392eee",
        strip_prefix = "github.com/mitchellh/copystructure@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mitchellh/copystructure/com_github_mitchellh_copystructure-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/mitchellh/copystructure/com_github_mitchellh_copystructure-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mitchellh/copystructure/com_github_mitchellh_copystructure-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mitchellh/copystructure/com_github_mitchellh_copystructure-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_mitchellh_go_homedir",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mitchellh/go-homedir",
        sha256 = "fffec361fc7e776bb71433560c285ee2982d2c140b8f5bfba0db6033c0ade184",
        strip_prefix = "github.com/mitchellh/go-homedir@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mitchellh/go-homedir/com_github_mitchellh_go_homedir-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/mitchellh/go-homedir/com_github_mitchellh_go_homedir-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mitchellh/go-homedir/com_github_mitchellh_go_homedir-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mitchellh/go-homedir/com_github_mitchellh_go_homedir-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_mitchellh_mapstructure",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mitchellh/mapstructure",
        sha256 = "118d5b2cb65c50dba967fb6d708f450a9caf93f321f8fc99080675b2ee374199",
        strip_prefix = "github.com/mitchellh/mapstructure@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mitchellh/mapstructure/com_github_mitchellh_mapstructure-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/mitchellh/mapstructure/com_github_mitchellh_mapstructure-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mitchellh/mapstructure/com_github_mitchellh_mapstructure-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mitchellh/mapstructure/com_github_mitchellh_mapstructure-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_mitchellh_reflectwalk",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mitchellh/reflectwalk",
        sha256 = "bf1d4540bf05ea244e65fca3e9f859d8129c381adaeebe7f22703959aadc4210",
        strip_prefix = "github.com/mitchellh/reflectwalk@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mitchellh/reflectwalk/com_github_mitchellh_reflectwalk-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/mitchellh/reflectwalk/com_github_mitchellh_reflectwalk-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mitchellh/reflectwalk/com_github_mitchellh_reflectwalk-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mitchellh/reflectwalk/com_github_mitchellh_reflectwalk-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_moby_spdystream",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/moby/spdystream",
        sha256 = "9db6d001a80f4c3cb332bb8a1bb9260908e1ffa9a20491e9bc05358263eed278",
        strip_prefix = "github.com/moby/spdystream@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/moby/spdystream/com_github_moby_spdystream-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/moby/spdystream/com_github_moby_spdystream-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/moby/spdystream/com_github_moby_spdystream-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/moby/spdystream/com_github_moby_spdystream-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_moby_term",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/moby/term",
        sha256 = "0d2e2ce8280f803a14d9c2af23a79cf854e06d47f2e6b7d455291ffd47c11e2f",
        strip_prefix = "github.com/moby/term@v0.0.0-20210619224110-3f7ff695adc6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/moby/term/com_github_moby_term-v0.0.0-20210619224110-3f7ff695adc6.zip",
            "http://ats.apps.svc/gomod/github.com/moby/term/com_github_moby_term-v0.0.0-20210619224110-3f7ff695adc6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/moby/term/com_github_moby_term-v0.0.0-20210619224110-3f7ff695adc6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/moby/term/com_github_moby_term-v0.0.0-20210619224110-3f7ff695adc6.zip",
        ],
    )
    go_repository(
        name = "com_github_modern_go_concurrent",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/modern-go/concurrent",
        sha256 = "91ef49599bec459869d94ff3dec128871ab66bd2dfa61041f1e1169f9b4a8073",
        strip_prefix = "github.com/modern-go/concurrent@v0.0.0-20180306012644-bacd9c7ef1dd",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/modern-go/concurrent/com_github_modern_go_concurrent-v0.0.0-20180306012644-bacd9c7ef1dd.zip",
            "http://ats.apps.svc/gomod/github.com/modern-go/concurrent/com_github_modern_go_concurrent-v0.0.0-20180306012644-bacd9c7ef1dd.zip",
            "https://cache.hawkingrei.com/gomod/github.com/modern-go/concurrent/com_github_modern_go_concurrent-v0.0.0-20180306012644-bacd9c7ef1dd.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/modern-go/concurrent/com_github_modern_go_concurrent-v0.0.0-20180306012644-bacd9c7ef1dd.zip",
        ],
    )
    go_repository(
        name = "com_github_modern_go_reflect2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/modern-go/reflect2",
        sha256 = "f46f41409c2e74293f82cfe6c70b5d582bff8ada0106a7d3ff5706520c50c21c",
        strip_prefix = "github.com/modern-go/reflect2@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/modern-go/reflect2/com_github_modern_go_reflect2-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/modern-go/reflect2/com_github_modern_go_reflect2-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/modern-go/reflect2/com_github_modern_go_reflect2-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/modern-go/reflect2/com_github_modern_go_reflect2-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_montanaflynn_stats",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/montanaflynn/stats",
        sha256 = "661546beb7c49f92a2c798709323f5cb175251bc359c061e5933071679f9b2ef",
        strip_prefix = "github.com/montanaflynn/stats@v0.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/montanaflynn/stats/com_github_montanaflynn_stats-v0.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/montanaflynn/stats/com_github_montanaflynn_stats-v0.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/montanaflynn/stats/com_github_montanaflynn_stats-v0.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/montanaflynn/stats/com_github_montanaflynn_stats-v0.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_moricho_tparallel",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/moricho/tparallel",
        sha256 = "12699235938c6b9b55034d85b55e133677c81f99726276ac93c30cd541759f7a",
        strip_prefix = "github.com/moricho/tparallel@v0.3.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/moricho/tparallel/com_github_moricho_tparallel-v0.3.2.zip",
            "http://ats.apps.svc/gomod/github.com/moricho/tparallel/com_github_moricho_tparallel-v0.3.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/moricho/tparallel/com_github_moricho_tparallel-v0.3.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/moricho/tparallel/com_github_moricho_tparallel-v0.3.2.zip",
        ],
    )
    go_repository(
        name = "com_github_morikuni_aec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/morikuni/aec",
        sha256 = "c14eeff6945b854edd8b91a83ac760fbd95068f33dc17d102c18f2e8e86bcced",
        strip_prefix = "github.com/morikuni/aec@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/morikuni/aec/com_github_morikuni_aec-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/morikuni/aec/com_github_morikuni_aec-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/morikuni/aec/com_github_morikuni_aec-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/morikuni/aec/com_github_morikuni_aec-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_muesli_termenv",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/muesli/termenv",
        sha256 = "ba02d3ebd9c1d87e2c2133b1f2bb61a7001b3765196e8016029ce9fe54c5c0fc",
        strip_prefix = "github.com/muesli/termenv@v0.16.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/muesli/termenv/com_github_muesli_termenv-v0.16.0.zip",
            "http://ats.apps.svc/gomod/github.com/muesli/termenv/com_github_muesli_termenv-v0.16.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/muesli/termenv/com_github_muesli_termenv-v0.16.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/muesli/termenv/com_github_muesli_termenv-v0.16.0.zip",
        ],
    )
    go_repository(
        name = "com_github_munnerz_goautoneg",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/munnerz/goautoneg",
        sha256 = "3d7ce17916779890be02ea6b3dd6345c3c30c1df502ad9d8b5b9b310e636afd9",
        strip_prefix = "github.com/munnerz/goautoneg@v0.0.0-20191010083416-a7dc8b61c822",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/munnerz/goautoneg/com_github_munnerz_goautoneg-v0.0.0-20191010083416-a7dc8b61c822.zip",
            "http://ats.apps.svc/gomod/github.com/munnerz/goautoneg/com_github_munnerz_goautoneg-v0.0.0-20191010083416-a7dc8b61c822.zip",
            "https://cache.hawkingrei.com/gomod/github.com/munnerz/goautoneg/com_github_munnerz_goautoneg-v0.0.0-20191010083416-a7dc8b61c822.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/munnerz/goautoneg/com_github_munnerz_goautoneg-v0.0.0-20191010083416-a7dc8b61c822.zip",
        ],
    )
    go_repository(
        name = "com_github_mwitkow_go_conntrack",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mwitkow/go-conntrack",
        sha256 = "d6fc513490d5c73e3f64ede3cf18ba973a4f8ef4c39c9816cc6080e39c8c480a",
        strip_prefix = "github.com/mwitkow/go-conntrack@v0.0.0-20190716064945-2f068394615f",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mwitkow/go-conntrack/com_github_mwitkow_go_conntrack-v0.0.0-20190716064945-2f068394615f.zip",
            "http://ats.apps.svc/gomod/github.com/mwitkow/go-conntrack/com_github_mwitkow_go_conntrack-v0.0.0-20190716064945-2f068394615f.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mwitkow/go-conntrack/com_github_mwitkow_go_conntrack-v0.0.0-20190716064945-2f068394615f.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mwitkow/go-conntrack/com_github_mwitkow_go_conntrack-v0.0.0-20190716064945-2f068394615f.zip",
        ],
    )
    go_repository(
        name = "com_github_mxk_go_flowrate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/mxk/go-flowrate",
        sha256 = "bd0701ef9115469a661c07a3e9c2e572114126eb2d098b01eda34ebf62548492",
        strip_prefix = "github.com/mxk/go-flowrate@v0.0.0-20140419014527-cca7078d478f",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/mxk/go-flowrate/com_github_mxk_go_flowrate-v0.0.0-20140419014527-cca7078d478f.zip",
            "http://ats.apps.svc/gomod/github.com/mxk/go-flowrate/com_github_mxk_go_flowrate-v0.0.0-20140419014527-cca7078d478f.zip",
            "https://cache.hawkingrei.com/gomod/github.com/mxk/go-flowrate/com_github_mxk_go_flowrate-v0.0.0-20140419014527-cca7078d478f.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/mxk/go-flowrate/com_github_mxk_go_flowrate-v0.0.0-20140419014527-cca7078d478f.zip",
        ],
    )
    go_repository(
        name = "com_github_nakabonne_nestif",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nakabonne/nestif",
        sha256 = "7c0a39bd8577b7b158e9213f70f8d92a704d19d74900eee4f5da0e9f233fa7c7",
        strip_prefix = "github.com/nakabonne/nestif@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nakabonne/nestif/com_github_nakabonne_nestif-v0.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/nakabonne/nestif/com_github_nakabonne_nestif-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nakabonne/nestif/com_github_nakabonne_nestif-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nakabonne/nestif/com_github_nakabonne_nestif-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_nbutton23_zxcvbn_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nbutton23/zxcvbn-go",
        sha256 = "ceffa831914e8b648effbc6c937c00c1c0287f99b1f0bc039218100c20242f2d",
        strip_prefix = "github.com/nbutton23/zxcvbn-go@v0.0.0-20210217022336-fa2cb2858354",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nbutton23/zxcvbn-go/com_github_nbutton23_zxcvbn_go-v0.0.0-20210217022336-fa2cb2858354.zip",
            "http://ats.apps.svc/gomod/github.com/nbutton23/zxcvbn-go/com_github_nbutton23_zxcvbn_go-v0.0.0-20210217022336-fa2cb2858354.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nbutton23/zxcvbn-go/com_github_nbutton23_zxcvbn_go-v0.0.0-20210217022336-fa2cb2858354.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nbutton23/zxcvbn-go/com_github_nbutton23_zxcvbn_go-v0.0.0-20210217022336-fa2cb2858354.zip",
        ],
    )
    go_repository(
        name = "com_github_ncw_directio",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ncw/directio",
        sha256 = "15266d0977e1466c6a3d9d436b069df02b8593d7901dbe18a60dd1ac851420f8",
        strip_prefix = "github.com/ncw/directio@v1.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ncw/directio/com_github_ncw_directio-v1.0.5.zip",
            "http://ats.apps.svc/gomod/github.com/ncw/directio/com_github_ncw_directio-v1.0.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ncw/directio/com_github_ncw_directio-v1.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ncw/directio/com_github_ncw_directio-v1.0.5.zip",
        ],
    )
    go_repository(
        name = "com_github_ngaut_pools",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ngaut/pools",
        sha256 = "26342833d7a5b91a52f8451e8e34bc9ffc5069d342666ab0b478628c41a86d44",
        strip_prefix = "github.com/ngaut/pools@v0.0.0-20180318154953-b7bc8c42aac7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ngaut/pools/com_github_ngaut_pools-v0.0.0-20180318154953-b7bc8c42aac7.zip",
            "http://ats.apps.svc/gomod/github.com/ngaut/pools/com_github_ngaut_pools-v0.0.0-20180318154953-b7bc8c42aac7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ngaut/pools/com_github_ngaut_pools-v0.0.0-20180318154953-b7bc8c42aac7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ngaut/pools/com_github_ngaut_pools-v0.0.0-20180318154953-b7bc8c42aac7.zip",
        ],
    )
    go_repository(
        name = "com_github_ngaut_sync2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ngaut/sync2",
        sha256 = "2635d6120b6172c190f84b57b5fc878f9158b768b4bd6bd4468bfa98a73061a4",
        strip_prefix = "github.com/ngaut/sync2@v0.0.0-20141008032647-7a24ed77b2ef",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ngaut/sync2/com_github_ngaut_sync2-v0.0.0-20141008032647-7a24ed77b2ef.zip",
            "http://ats.apps.svc/gomod/github.com/ngaut/sync2/com_github_ngaut_sync2-v0.0.0-20141008032647-7a24ed77b2ef.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ngaut/sync2/com_github_ngaut_sync2-v0.0.0-20141008032647-7a24ed77b2ef.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ngaut/sync2/com_github_ngaut_sync2-v0.0.0-20141008032647-7a24ed77b2ef.zip",
        ],
    )
    go_repository(
        name = "com_github_nishanths_exhaustive",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nishanths/exhaustive",
        sha256 = "2b60661abebe145c072c3ca54956d182999f6cca074e4b2f144f559f70c8e4bd",
        strip_prefix = "github.com/nishanths/exhaustive@v0.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nishanths/exhaustive/com_github_nishanths_exhaustive-v0.12.0.zip",
            "http://ats.apps.svc/gomod/github.com/nishanths/exhaustive/com_github_nishanths_exhaustive-v0.12.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nishanths/exhaustive/com_github_nishanths_exhaustive-v0.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nishanths/exhaustive/com_github_nishanths_exhaustive-v0.12.0.zip",
        ],
    )
    go_repository(
        name = "com_github_nishanths_predeclared",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nishanths/predeclared",
        sha256 = "8ab7ff9f539ec50902647a9be76d7408e9f501958efd14973891ac4be87a4486",
        strip_prefix = "github.com/nishanths/predeclared@v0.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nishanths/predeclared/com_github_nishanths_predeclared-v0.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/nishanths/predeclared/com_github_nishanths_predeclared-v0.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nishanths/predeclared/com_github_nishanths_predeclared-v0.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nishanths/predeclared/com_github_nishanths_predeclared-v0.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_nsf_jsondiff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nsf/jsondiff",
        sha256 = "d468c06359490d96ea701107f848acc7d9497e36eeb9eb81e38c8bef69c42fd2",
        strip_prefix = "github.com/nsf/jsondiff@v0.0.0-20230430225905-43f6cf3098c1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nsf/jsondiff/com_github_nsf_jsondiff-v0.0.0-20230430225905-43f6cf3098c1.zip",
            "http://ats.apps.svc/gomod/github.com/nsf/jsondiff/com_github_nsf_jsondiff-v0.0.0-20230430225905-43f6cf3098c1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nsf/jsondiff/com_github_nsf_jsondiff-v0.0.0-20230430225905-43f6cf3098c1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nsf/jsondiff/com_github_nsf_jsondiff-v0.0.0-20230430225905-43f6cf3098c1.zip",
        ],
    )
    go_repository(
        name = "com_github_nunnatsa_ginkgolinter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nunnatsa/ginkgolinter",
        sha256 = "a6f46e72a4575ad1f1ade07170018b50c38977daa03747b6087219d1d3280a6f",
        strip_prefix = "github.com/nunnatsa/ginkgolinter@v0.20.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nunnatsa/ginkgolinter/com_github_nunnatsa_ginkgolinter-v0.20.0.zip",
            "http://ats.apps.svc/gomod/github.com/nunnatsa/ginkgolinter/com_github_nunnatsa_ginkgolinter-v0.20.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nunnatsa/ginkgolinter/com_github_nunnatsa_ginkgolinter-v0.20.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nunnatsa/ginkgolinter/com_github_nunnatsa_ginkgolinter-v0.20.0.zip",
        ],
    )
    go_repository(
        name = "com_github_nxadm_tail",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/nxadm/tail",
        sha256 = "70bf6e142f90694059792f7d5b31a915df989e8a6a554a836de36fa075377ff9",
        strip_prefix = "github.com/nxadm/tail@v1.4.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/nxadm/tail/com_github_nxadm_tail-v1.4.8.zip",
            "http://ats.apps.svc/gomod/github.com/nxadm/tail/com_github_nxadm_tail-v1.4.8.zip",
            "https://cache.hawkingrei.com/gomod/github.com/nxadm/tail/com_github_nxadm_tail-v1.4.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/nxadm/tail/com_github_nxadm_tail-v1.4.8.zip",
        ],
    )
    go_repository(
        name = "com_github_oklog_run",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/oklog/run",
        sha256 = "d6f69fc71aa155043f926c2a98fc1e5b3a8ebab422f2f36d785cfba38a7ebee4",
        strip_prefix = "github.com/oklog/run@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/oklog/run/com_github_oklog_run-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/oklog/run/com_github_oklog_run-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/oklog/run/com_github_oklog_run-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/oklog/run/com_github_oklog_run-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_oklog_ulid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/oklog/ulid",
        sha256 = "40e502c064a922d5eb7f2bc2cda9c6a2a929ec0fc76c9aae4db54fb7b6b611ae",
        strip_prefix = "github.com/oklog/ulid@v1.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/oklog/ulid/com_github_oklog_ulid-v1.3.1.zip",
            "http://ats.apps.svc/gomod/github.com/oklog/ulid/com_github_oklog_ulid-v1.3.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/oklog/ulid/com_github_oklog_ulid-v1.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/oklog/ulid/com_github_oklog_ulid-v1.3.1.zip",
        ],
    )
    go_repository(
        name = "com_github_onsi_ginkgo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/onsi/ginkgo",
        sha256 = "e23fc33b0affa73a4f4c63410af931bf1f8d5b9db266b3461177036d725eacc5",
        strip_prefix = "github.com/onsi/ginkgo@v1.16.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/onsi/ginkgo/com_github_onsi_ginkgo-v1.16.5.zip",
            "http://ats.apps.svc/gomod/github.com/onsi/ginkgo/com_github_onsi_ginkgo-v1.16.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/onsi/ginkgo/com_github_onsi_ginkgo-v1.16.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/onsi/ginkgo/com_github_onsi_ginkgo-v1.16.5.zip",
        ],
    )
    go_repository(
        name = "com_github_onsi_ginkgo_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/onsi/ginkgo/v2",
        sha256 = "4865aab6c56b0d29a93cfe56206b586f1c9f36fde5a66e85650576344861b7cc",
        strip_prefix = "github.com/onsi/ginkgo/v2@v2.13.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/onsi/ginkgo/v2/com_github_onsi_ginkgo_v2-v2.13.0.zip",
            "http://ats.apps.svc/gomod/github.com/onsi/ginkgo/v2/com_github_onsi_ginkgo_v2-v2.13.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/onsi/ginkgo/v2/com_github_onsi_ginkgo_v2-v2.13.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/onsi/ginkgo/v2/com_github_onsi_ginkgo_v2-v2.13.0.zip",
        ],
    )
    go_repository(
        name = "com_github_onsi_gomega",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/onsi/gomega",
        sha256 = "923e8d0a1f95b3989f31c45142dee0b80a0aaa00cfa210bbd4d059f7046d12a8",
        strip_prefix = "github.com/onsi/gomega@v1.29.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/onsi/gomega/com_github_onsi_gomega-v1.29.0.zip",
            "http://ats.apps.svc/gomod/github.com/onsi/gomega/com_github_onsi_gomega-v1.29.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/onsi/gomega/com_github_onsi_gomega-v1.29.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/onsi/gomega/com_github_onsi_gomega-v1.29.0.zip",
        ],
    )
    go_repository(
        name = "com_github_openai_openai_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/openai/openai-go",
        sha256 = "a44472c58973413a5b2ca7880d028e19cc98e7a99405693f679f464ac4c570c3",
        strip_prefix = "github.com/openai/openai-go@v0.1.0-alpha.59",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/openai/openai-go/com_github_openai_openai_go-v0.1.0-alpha.59.zip",
            "http://ats.apps.svc/gomod/github.com/openai/openai-go/com_github_openai_openai_go-v0.1.0-alpha.59.zip",
            "https://cache.hawkingrei.com/gomod/github.com/openai/openai-go/com_github_openai_openai_go-v0.1.0-alpha.59.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/openai/openai-go/com_github_openai_openai_go-v0.1.0-alpha.59.zip",
        ],
    )
    go_repository(
        name = "com_github_opencontainers_go_digest",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/opencontainers/go-digest",
        sha256 = "615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86",
        strip_prefix = "github.com/opencontainers/go-digest@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/opencontainers/go-digest/com_github_opencontainers_go_digest-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/opencontainers/go-digest/com_github_opencontainers_go_digest-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/opencontainers/go-digest/com_github_opencontainers_go_digest-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/opencontainers/go-digest/com_github_opencontainers_go_digest-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_opencontainers_image_spec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/opencontainers/image-spec",
        sha256 = "d842127b6038c1a74c2bb609d75bdde0ac9c7cde5c354ac82c4f953ce08d0c08",
        strip_prefix = "github.com/opencontainers/image-spec@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/opencontainers/image-spec/com_github_opencontainers_image_spec-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/opencontainers/image-spec/com_github_opencontainers_image_spec-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/opencontainers/image-spec/com_github_opencontainers_image_spec-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/opencontainers/image-spec/com_github_opencontainers_image_spec-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_opencontainers_runtime_spec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/opencontainers/runtime-spec",
        sha256 = "bd1531bb27014e2a16ea4bf0b56bff7688555bb859f651c1e4375f4b782269ec",
        strip_prefix = "github.com/opencontainers/runtime-spec@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/opencontainers/runtime-spec/com_github_opencontainers_runtime_spec-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/opencontainers/runtime-spec/com_github_opencontainers_runtime_spec-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/opencontainers/runtime-spec/com_github_opencontainers_runtime_spec-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/opencontainers/runtime-spec/com_github_opencontainers_runtime_spec-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_openpeedeep_depguard_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/OpenPeeDeeP/depguard/v2",
        sha256 = "a4f27b527fe9e749028118d7ded1795b3e3bad0436b74310f7cedeb2329f433b",
        strip_prefix = "github.com/OpenPeeDeeP/depguard/v2@v2.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/OpenPeeDeeP/depguard/v2/com_github_openpeedeep_depguard_v2-v2.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/OpenPeeDeeP/depguard/v2/com_github_openpeedeep_depguard_v2-v2.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/OpenPeeDeeP/depguard/v2/com_github_openpeedeep_depguard_v2-v2.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/OpenPeeDeeP/depguard/v2/com_github_openpeedeep_depguard_v2-v2.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_opentracing_basictracer_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/opentracing/basictracer-go",
        sha256 = "a908957c8e55b7b036b4761fb64c643806fcb9b59d4e7c6fcd03fca1105a9156",
        strip_prefix = "github.com/opentracing/basictracer-go@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/opentracing/basictracer-go/com_github_opentracing_basictracer_go-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/opentracing/basictracer-go/com_github_opentracing_basictracer_go-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/opentracing/basictracer-go/com_github_opentracing_basictracer_go-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/opentracing/basictracer-go/com_github_opentracing_basictracer_go-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_opentracing_opentracing_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/opentracing/opentracing-go",
        sha256 = "9b1a75e9a454a0cf01a26c18e48cd321e3b300943ac5adb9098ba033dbd40db5",
        strip_prefix = "github.com/opentracing/opentracing-go@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/opentracing/opentracing-go/com_github_opentracing_opentracing_go-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/opentracing/opentracing-go/com_github_opentracing_opentracing_go-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/opentracing/opentracing-go/com_github_opentracing_opentracing_go-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/opentracing/opentracing-go/com_github_opentracing_opentracing_go-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_otiai10_copy",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/otiai10/copy",
        sha256 = "a3712bae8f43c57bd9b4cfbc609ec52617c5aced3f89ca2f0e2bb055d127035d",
        strip_prefix = "github.com/otiai10/copy@v1.14.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/otiai10/copy/com_github_otiai10_copy-v1.14.0.zip",
            "http://ats.apps.svc/gomod/github.com/otiai10/copy/com_github_otiai10_copy-v1.14.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/otiai10/copy/com_github_otiai10_copy-v1.14.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/otiai10/copy/com_github_otiai10_copy-v1.14.0.zip",
        ],
    )
    go_repository(
        name = "com_github_otiai10_curr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/otiai10/curr",
        sha256 = "92b3cefe0f58f1b702f3ac92f352585b8ff25a6b35df0d0b6f3e299864de309f",
        strip_prefix = "github.com/otiai10/curr@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/otiai10/curr/com_github_otiai10_curr-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/otiai10/curr/com_github_otiai10_curr-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/otiai10/curr/com_github_otiai10_curr-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/otiai10/curr/com_github_otiai10_curr-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_otiai10_mint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/otiai10/mint",
        sha256 = "2fd679bb9287f3c035dfeb1200c80abce6a466138cc44471f708217ce4c5d13f",
        strip_prefix = "github.com/otiai10/mint@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/otiai10/mint/com_github_otiai10_mint-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/otiai10/mint/com_github_otiai10_mint-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/otiai10/mint/com_github_otiai10_mint-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/otiai10/mint/com_github_otiai10_mint-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ovh_go_ovh",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ovh/go-ovh",
        sha256 = "011dc40423f453de4570f9ad737ff4185e0205aa11d294e1bd606fb70f07177b",
        strip_prefix = "github.com/ovh/go-ovh@v1.4.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ovh/go-ovh/com_github_ovh_go_ovh-v1.4.3.zip",
            "http://ats.apps.svc/gomod/github.com/ovh/go-ovh/com_github_ovh_go_ovh-v1.4.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ovh/go-ovh/com_github_ovh_go_ovh-v1.4.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ovh/go-ovh/com_github_ovh_go_ovh-v1.4.3.zip",
        ],
    )
    go_repository(
        name = "com_github_pbnjay_memory",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pbnjay/memory",
        sha256 = "5caf461e903c1060392e03a59eb84eb08c4a0976d0cc2d751fa9715cc6fc03bd",
        strip_prefix = "github.com/pbnjay/memory@v0.0.0-20210728143218-7b4eea64cf58",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pbnjay/memory/com_github_pbnjay_memory-v0.0.0-20210728143218-7b4eea64cf58.zip",
            "http://ats.apps.svc/gomod/github.com/pbnjay/memory/com_github_pbnjay_memory-v0.0.0-20210728143218-7b4eea64cf58.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pbnjay/memory/com_github_pbnjay_memory-v0.0.0-20210728143218-7b4eea64cf58.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pbnjay/memory/com_github_pbnjay_memory-v0.0.0-20210728143218-7b4eea64cf58.zip",
        ],
    )
    go_repository(
        name = "com_github_pborman_getopt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pborman/getopt",
        sha256 = "2c7e5c93709a3b3302d63f8239679d5b0c33f1dc0e1a18ce8167fb97df09f90a",
        strip_prefix = "github.com/pborman/getopt@v0.0.0-20180729010549-6fdd0a2c7117",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pborman/getopt/com_github_pborman_getopt-v0.0.0-20180729010549-6fdd0a2c7117.zip",
            "http://ats.apps.svc/gomod/github.com/pborman/getopt/com_github_pborman_getopt-v0.0.0-20180729010549-6fdd0a2c7117.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pborman/getopt/com_github_pborman_getopt-v0.0.0-20180729010549-6fdd0a2c7117.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pborman/getopt/com_github_pborman_getopt-v0.0.0-20180729010549-6fdd0a2c7117.zip",
        ],
    )
    go_repository(
        name = "com_github_pelletier_go_toml",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pelletier/go-toml",
        sha256 = "de3dcda660cc800cd86d03273a25956d67f416e8fcbe4d2001a2cb4a01e6ac60",
        strip_prefix = "github.com/pelletier/go-toml@v1.9.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pelletier/go-toml/com_github_pelletier_go_toml-v1.9.5.zip",
            "http://ats.apps.svc/gomod/github.com/pelletier/go-toml/com_github_pelletier_go_toml-v1.9.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pelletier/go-toml/com_github_pelletier_go_toml-v1.9.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pelletier/go-toml/com_github_pelletier_go_toml-v1.9.5.zip",
        ],
    )
    go_repository(
        name = "com_github_pelletier_go_toml_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pelletier/go-toml/v2",
        sha256 = "82162be7b85077f3be49bfe0f1e01f308b9c9554c72a980a22a34432f94885f0",
        strip_prefix = "github.com/pelletier/go-toml/v2@v2.2.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pelletier/go-toml/v2/com_github_pelletier_go_toml_v2-v2.2.4.zip",
            "http://ats.apps.svc/gomod/github.com/pelletier/go-toml/v2/com_github_pelletier_go_toml_v2-v2.2.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pelletier/go-toml/v2/com_github_pelletier_go_toml_v2-v2.2.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pelletier/go-toml/v2/com_github_pelletier_go_toml_v2-v2.2.4.zip",
        ],
    )
    go_repository(
        name = "com_github_petermattis_goid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/petermattis/goid",
        sha256 = "3f47ab8e5713c36ec5b4295956a5ef012a192bc19198ae1b6591408c061e97ab",
        strip_prefix = "github.com/petermattis/goid@v0.0.0-20240813172612-4fcff4a6cae7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/petermattis/goid/com_github_petermattis_goid-v0.0.0-20240813172612-4fcff4a6cae7.zip",
            "http://ats.apps.svc/gomod/github.com/petermattis/goid/com_github_petermattis_goid-v0.0.0-20240813172612-4fcff4a6cae7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/petermattis/goid/com_github_petermattis_goid-v0.0.0-20240813172612-4fcff4a6cae7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/petermattis/goid/com_github_petermattis_goid-v0.0.0-20240813172612-4fcff4a6cae7.zip",
        ],
    )
    go_repository(
        name = "com_github_phayes_freeport",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/phayes/freeport",
        sha256 = "4ac97358de55a9b1ac60f13fdb223c5309a129fb3fb7bf731062f9c095a0796c",
        strip_prefix = "github.com/phayes/freeport@v0.0.0-20180830031419-95f893ade6f2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/phayes/freeport/com_github_phayes_freeport-v0.0.0-20180830031419-95f893ade6f2.zip",
            "http://ats.apps.svc/gomod/github.com/phayes/freeport/com_github_phayes_freeport-v0.0.0-20180830031419-95f893ade6f2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/phayes/freeport/com_github_phayes_freeport-v0.0.0-20180830031419-95f893ade6f2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/phayes/freeport/com_github_phayes_freeport-v0.0.0-20180830031419-95f893ade6f2.zip",
        ],
    )
    go_repository(
        name = "com_github_phpdave11_gofpdf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/phpdave11/gofpdf",
        sha256 = "4db05258f281b40d8a17392fd71648779ea758a9aa506a8d1346ded737ede43f",
        strip_prefix = "github.com/phpdave11/gofpdf@v1.4.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/phpdave11/gofpdf/com_github_phpdave11_gofpdf-v1.4.2.zip",
            "http://ats.apps.svc/gomod/github.com/phpdave11/gofpdf/com_github_phpdave11_gofpdf-v1.4.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/phpdave11/gofpdf/com_github_phpdave11_gofpdf-v1.4.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/phpdave11/gofpdf/com_github_phpdave11_gofpdf-v1.4.2.zip",
        ],
    )
    go_repository(
        name = "com_github_phpdave11_gofpdi",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/phpdave11/gofpdi",
        sha256 = "09b728136cf290f4ee87aa47b60f2f9df2b3f4f64119ff10f12319bc3438b58d",
        strip_prefix = "github.com/phpdave11/gofpdi@v1.0.13",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/phpdave11/gofpdi/com_github_phpdave11_gofpdi-v1.0.13.zip",
            "http://ats.apps.svc/gomod/github.com/phpdave11/gofpdi/com_github_phpdave11_gofpdi-v1.0.13.zip",
            "https://cache.hawkingrei.com/gomod/github.com/phpdave11/gofpdi/com_github_phpdave11_gofpdi-v1.0.13.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/phpdave11/gofpdi/com_github_phpdave11_gofpdi-v1.0.13.zip",
        ],
    )
    go_repository(
        name = "com_github_pierrec_lz4_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pierrec/lz4/v4",
        sha256 = "5dadfc447d593c4a8a75520b9f048142d725e4d966d48883ece2380c16081900",
        strip_prefix = "github.com/pierrec/lz4/v4@v4.1.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pierrec/lz4/v4/com_github_pierrec_lz4_v4-v4.1.15.zip",
            "http://ats.apps.svc/gomod/github.com/pierrec/lz4/v4/com_github_pierrec_lz4_v4-v4.1.15.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pierrec/lz4/v4/com_github_pierrec_lz4_v4-v4.1.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pierrec/lz4/v4/com_github_pierrec_lz4_v4-v4.1.15.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_badger",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/badger",
        sha256 = "fb682917c8f83e464e54334b7ec43db2b1eaaf13daa36d42433a69a8650f37db",
        strip_prefix = "github.com/pingcap/badger@v1.5.1-0.20241015064302-38533b6cbf8d",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/badger/com_github_pingcap_badger-v1.5.1-0.20241015064302-38533b6cbf8d.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/badger/com_github_pingcap_badger-v1.5.1-0.20241015064302-38533b6cbf8d.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/badger/com_github_pingcap_badger-v1.5.1-0.20241015064302-38533b6cbf8d.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/badger/com_github_pingcap_badger-v1.5.1-0.20241015064302-38533b6cbf8d.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/errors",
        sha256 = "b696ac3d19b74bd6c3454048767bf145c7d8b4d24c55337b27d2e0960d948949",
        strip_prefix = "github.com/pingcap/errors@v0.11.5-0.20250523034308-74f78ae071ee",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/errors/com_github_pingcap_errors-v0.11.5-0.20250523034308-74f78ae071ee.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/errors/com_github_pingcap_errors-v0.11.5-0.20250523034308-74f78ae071ee.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/errors/com_github_pingcap_errors-v0.11.5-0.20250523034308-74f78ae071ee.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/errors/com_github_pingcap_errors-v0.11.5-0.20250523034308-74f78ae071ee.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_failpoint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/failpoint",
        sha256 = "fb2b8146ff608751050d56d0506d271f75afa030d2d09d2da9e2bac562f6a866",
        strip_prefix = "github.com/pingcap/failpoint@v0.0.0-20240528011301-b51a646c7c86",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/failpoint/com_github_pingcap_failpoint-v0.0.0-20240528011301-b51a646c7c86.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/failpoint/com_github_pingcap_failpoint-v0.0.0-20240528011301-b51a646c7c86.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/failpoint/com_github_pingcap_failpoint-v0.0.0-20240528011301-b51a646c7c86.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/failpoint/com_github_pingcap_failpoint-v0.0.0-20240528011301-b51a646c7c86.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_fn",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/fn",
        sha256 = "475d1567fdb2c9f630089100ce709d35fbaae2b4b1cf088a0581b98699443658",
        strip_prefix = "github.com/pingcap/fn@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/fn/com_github_pingcap_fn-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/fn/com_github_pingcap_fn-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/fn/com_github_pingcap_fn-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/fn/com_github_pingcap_fn-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_goleveldb",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/goleveldb",
        sha256 = "12ddc24d12eeab431e3414be06a6e33976dcd7e2eb2fff9c015e6f9a77a66d53",
        strip_prefix = "github.com/pingcap/goleveldb@v0.0.0-20191226122134-f82aafb29989",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/goleveldb/com_github_pingcap_goleveldb-v0.0.0-20191226122134-f82aafb29989.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/goleveldb/com_github_pingcap_goleveldb-v0.0.0-20191226122134-f82aafb29989.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/goleveldb/com_github_pingcap_goleveldb-v0.0.0-20191226122134-f82aafb29989.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/goleveldb/com_github_pingcap_goleveldb-v0.0.0-20191226122134-f82aafb29989.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_kvproto",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/kvproto",
        sha256 = "c2338e5e6c81df58c2d72a08af3ac0c3670adc4dd55f48811a4a92ae4c6a01cc",
        strip_prefix = "github.com/pingcap/kvproto@v0.0.0-20250616075548-d951fb623bb3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/kvproto/com_github_pingcap_kvproto-v0.0.0-20250616075548-d951fb623bb3.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/kvproto/com_github_pingcap_kvproto-v0.0.0-20250616075548-d951fb623bb3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/kvproto/com_github_pingcap_kvproto-v0.0.0-20250616075548-d951fb623bb3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/kvproto/com_github_pingcap_kvproto-v0.0.0-20250616075548-d951fb623bb3.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_log",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/log",
        sha256 = "ca74400554017427f09ab72ffb5ba4b6e1f8b92235839f518fc102a3231aa267",
        strip_prefix = "github.com/pingcap/log@v1.1.1-0.20250514022801-14f3b4ca066e",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/log/com_github_pingcap_log-v1.1.1-0.20250514022801-14f3b4ca066e.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/log/com_github_pingcap_log-v1.1.1-0.20250514022801-14f3b4ca066e.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/log/com_github_pingcap_log-v1.1.1-0.20250514022801-14f3b4ca066e.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/log/com_github_pingcap_log-v1.1.1-0.20250514022801-14f3b4ca066e.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_sysutil",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/sysutil",
        sha256 = "c2ffa4a6d163ca73e73831de5abaa25d47abba59c41b8a549d70935442921a56",
        strip_prefix = "github.com/pingcap/sysutil@v1.0.1-0.20240311050922-ae81ee01f3a5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/sysutil/com_github_pingcap_sysutil-v1.0.1-0.20240311050922-ae81ee01f3a5.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/sysutil/com_github_pingcap_sysutil-v1.0.1-0.20240311050922-ae81ee01f3a5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/sysutil/com_github_pingcap_sysutil-v1.0.1-0.20240311050922-ae81ee01f3a5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/sysutil/com_github_pingcap_sysutil-v1.0.1-0.20240311050922-ae81ee01f3a5.zip",
        ],
    )
    go_repository(
        name = "com_github_pingcap_tipb",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pingcap/tipb",
        sha256 = "b18847e2b60ee85d4b78a89b0d6435cccabf97605bc942ffe53cc3c12f27caa9",
        strip_prefix = "github.com/pingcap/tipb@v0.0.0-20250605054300-07d1c2a671ee",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pingcap/tipb/com_github_pingcap_tipb-v0.0.0-20250605054300-07d1c2a671ee.zip",
            "http://ats.apps.svc/gomod/github.com/pingcap/tipb/com_github_pingcap_tipb-v0.0.0-20250605054300-07d1c2a671ee.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pingcap/tipb/com_github_pingcap_tipb-v0.0.0-20250605054300-07d1c2a671ee.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pingcap/tipb/com_github_pingcap_tipb-v0.0.0-20250605054300-07d1c2a671ee.zip",
        ],
    )
    go_repository(
        name = "com_github_pkg_browser",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/browser",
        sha256 = "8524ae36d809564d1f218978593b5c565cf3ee8dccd035d66b336ad0c56e60d1",
        strip_prefix = "github.com/pkg/browser@v0.0.0-20240102092130-5ac0b6a4141c",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pkg/browser/com_github_pkg_browser-v0.0.0-20240102092130-5ac0b6a4141c.zip",
            "http://ats.apps.svc/gomod/github.com/pkg/browser/com_github_pkg_browser-v0.0.0-20240102092130-5ac0b6a4141c.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pkg/browser/com_github_pkg_browser-v0.0.0-20240102092130-5ac0b6a4141c.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pkg/browser/com_github_pkg_browser-v0.0.0-20240102092130-5ac0b6a4141c.zip",
        ],
    )
    go_repository(
        name = "com_github_pkg_diff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/diff",
        sha256 = "f35b23fdd2b9522ddd46cc5c0161b4f0765c514475d5d4ca2a86aca31388c8bd",
        strip_prefix = "github.com/pkg/diff@v0.0.0-20210226163009-20ebb0f2a09e",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pkg/diff/com_github_pkg_diff-v0.0.0-20210226163009-20ebb0f2a09e.zip",
            "http://ats.apps.svc/gomod/github.com/pkg/diff/com_github_pkg_diff-v0.0.0-20210226163009-20ebb0f2a09e.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pkg/diff/com_github_pkg_diff-v0.0.0-20210226163009-20ebb0f2a09e.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pkg/diff/com_github_pkg_diff-v0.0.0-20210226163009-20ebb0f2a09e.zip",
        ],
    )
    go_repository(
        name = "com_github_pkg_errors",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/errors",
        sha256 = "d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07",
        strip_prefix = "github.com/pkg/errors@v0.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pkg/errors/com_github_pkg_errors-v0.9.1.zip",
            "http://ats.apps.svc/gomod/github.com/pkg/errors/com_github_pkg_errors-v0.9.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pkg/errors/com_github_pkg_errors-v0.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pkg/errors/com_github_pkg_errors-v0.9.1.zip",
        ],
    )
    go_repository(
        name = "com_github_pkg_profile",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/profile",
        sha256 = "0584fead1e820230c0b8910c3ce43668a1875c82e398faa0450c9e72c2d29c0a",
        strip_prefix = "github.com/pkg/profile@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pkg/profile/com_github_pkg_profile-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/pkg/profile/com_github_pkg_profile-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pkg/profile/com_github_pkg_profile-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pkg/profile/com_github_pkg_profile-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_pkg_xattr",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pkg/xattr",
        sha256 = "03aa1ce578e02548201e7099bd53bd18a56d8cd7ae44bb7d8ab9457a5fb34b06",
        strip_prefix = "github.com/pkg/xattr@v0.4.9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pkg/xattr/com_github_pkg_xattr-v0.4.9.zip",
            "http://ats.apps.svc/gomod/github.com/pkg/xattr/com_github_pkg_xattr-v0.4.9.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pkg/xattr/com_github_pkg_xattr-v0.4.9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pkg/xattr/com_github_pkg_xattr-v0.4.9.zip",
        ],
    )
    go_repository(
        name = "com_github_pmezard_go_difflib",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/pmezard/go-difflib",
        sha256 = "24ff45e356f638a53bd0c89fff961fbeaecfdb0dc5e482ceed0a2230e0e5f3b7",
        strip_prefix = "github.com/pmezard/go-difflib@v1.0.1-0.20181226105442-5d4384ee4fb2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/pmezard/go-difflib/com_github_pmezard_go_difflib-v1.0.1-0.20181226105442-5d4384ee4fb2.zip",
            "http://ats.apps.svc/gomod/github.com/pmezard/go-difflib/com_github_pmezard_go_difflib-v1.0.1-0.20181226105442-5d4384ee4fb2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/pmezard/go-difflib/com_github_pmezard_go_difflib-v1.0.1-0.20181226105442-5d4384ee4fb2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/pmezard/go-difflib/com_github_pmezard_go_difflib-v1.0.1-0.20181226105442-5d4384ee4fb2.zip",
        ],
    )
    go_repository(
        name = "com_github_polyfloyd_go_errorlint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/polyfloyd/go-errorlint",
        sha256 = "8136018c68b2a2f3a9e2cd10ee59ddcace5581a1ec3468e68c175fc5a335c2c1",
        strip_prefix = "github.com/polyfloyd/go-errorlint@v1.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/polyfloyd/go-errorlint/com_github_polyfloyd_go_errorlint-v1.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/polyfloyd/go-errorlint/com_github_polyfloyd_go_errorlint-v1.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/polyfloyd/go-errorlint/com_github_polyfloyd_go_errorlint-v1.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/polyfloyd/go-errorlint/com_github_polyfloyd_go_errorlint-v1.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_power_devops_perfstat",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/power-devops/perfstat",
        sha256 = "4006b3bcc7ee4fa14a2075e64ae352f825afda0b3b62f227b5a5e1c0613af0fa",
        strip_prefix = "github.com/power-devops/perfstat@v0.0.0-20221212215047-62379fc7944b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/power-devops/perfstat/com_github_power_devops_perfstat-v0.0.0-20221212215047-62379fc7944b.zip",
            "http://ats.apps.svc/gomod/github.com/power-devops/perfstat/com_github_power_devops_perfstat-v0.0.0-20221212215047-62379fc7944b.zip",
            "https://cache.hawkingrei.com/gomod/github.com/power-devops/perfstat/com_github_power_devops_perfstat-v0.0.0-20221212215047-62379fc7944b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/power-devops/perfstat/com_github_power_devops_perfstat-v0.0.0-20221212215047-62379fc7944b.zip",
        ],
    )
    go_repository(
        name = "com_github_prashantv_gostub",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prashantv/gostub",
        sha256 = "9a56047ad14092b80489df340d6ff1adbb7db588f1558714dd5584f4d163d41e",
        strip_prefix = "github.com/prashantv/gostub@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prashantv/gostub/com_github_prashantv_gostub-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/prashantv/gostub/com_github_prashantv_gostub-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prashantv/gostub/com_github_prashantv_gostub-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prashantv/gostub/com_github_prashantv_gostub-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_alertmanager",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/alertmanager",
        sha256 = "7666007c7ccec339fd09aaeec1d15c5b8c26cb01d387c9a9f7273f904db825b0",
        strip_prefix = "github.com/prometheus/alertmanager@v0.26.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/alertmanager/com_github_prometheus_alertmanager-v0.26.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/alertmanager/com_github_prometheus_alertmanager-v0.26.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/alertmanager/com_github_prometheus_alertmanager-v0.26.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/alertmanager/com_github_prometheus_alertmanager-v0.26.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_client_golang",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/client_golang",
        sha256 = "ab84ebfcbae87a0cbecc01b537f73eec6047d4f016c29719feb922470f086aa2",
        strip_prefix = "github.com/prometheus/client_golang@v1.22.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/client_golang/com_github_prometheus_client_golang-v1.22.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/client_golang/com_github_prometheus_client_golang-v1.22.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/client_golang/com_github_prometheus_client_golang-v1.22.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/client_golang/com_github_prometheus_client_golang-v1.22.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_client_model",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/client_model",
        sha256 = "67017b19f220c6ab91ecfdd10a93824e2a8b09fcb6390054dbdc49df3354a9ca",
        strip_prefix = "github.com/prometheus/client_model@v0.6.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/client_model/com_github_prometheus_client_model-v0.6.2.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/client_model/com_github_prometheus_client_model-v0.6.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/client_model/com_github_prometheus_client_model-v0.6.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/client_model/com_github_prometheus_client_model-v0.6.2.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_common",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/common",
        sha256 = "8f7ceb4d12a165e6b4533dc994937b936717daa3c2b231a499f8189372cfc843",
        strip_prefix = "github.com/prometheus/common@v0.63.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/common/com_github_prometheus_common-v0.63.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/common/com_github_prometheus_common-v0.63.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/common/com_github_prometheus_common-v0.63.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/common/com_github_prometheus_common-v0.63.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_common_assets",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/common/assets",
        sha256 = "e8bcf444eb69d4dc41764f84401d57a181d282250e4c97b3c2bb31edc93e984b",
        strip_prefix = "github.com/prometheus/common/assets@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/common/assets/com_github_prometheus_common_assets-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/common/assets/com_github_prometheus_common_assets-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/common/assets/com_github_prometheus_common_assets-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/common/assets/com_github_prometheus_common_assets-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_common_sigv4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/common/sigv4",
        sha256 = "e76ec796837158dc2624343f88da4ba3c5d9d4b45e66b359358eba5db39846dd",
        strip_prefix = "github.com/prometheus/common/sigv4@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/common/sigv4/com_github_prometheus_common_sigv4-v0.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/common/sigv4/com_github_prometheus_common_sigv4-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/common/sigv4/com_github_prometheus_common_sigv4-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/common/sigv4/com_github_prometheus_common_sigv4-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_exporter_toolkit",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/exporter-toolkit",
        sha256 = "30605de7fc911194ff45289870b4a56d9da2aca9e8f60de810bc65af77cdd2cb",
        strip_prefix = "github.com/prometheus/exporter-toolkit@v0.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/exporter-toolkit/com_github_prometheus_exporter_toolkit-v0.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/exporter-toolkit/com_github_prometheus_exporter_toolkit-v0.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/exporter-toolkit/com_github_prometheus_exporter_toolkit-v0.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/exporter-toolkit/com_github_prometheus_exporter_toolkit-v0.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_procfs",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/procfs",
        sha256 = "e4b74815566cbf5aa372d23e1de32f16ac5c3c4c80bc94a31fdee60a1de6074a",
        strip_prefix = "github.com/prometheus/procfs@v0.16.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/procfs/com_github_prometheus_procfs-v0.16.1.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/procfs/com_github_prometheus_procfs-v0.16.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/procfs/com_github_prometheus_procfs-v0.16.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/procfs/com_github_prometheus_procfs-v0.16.1.zip",
        ],
    )
    go_repository(
        name = "com_github_prometheus_prometheus",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/prometheus/prometheus",
        sha256 = "10d025d507269bf23714992664755f8fed449dd1c8b9cb113a72e29baebcaa64",
        strip_prefix = "github.com/prometheus/prometheus@v0.50.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/prometheus/prometheus/com_github_prometheus_prometheus-v0.50.1.zip",
            "http://ats.apps.svc/gomod/github.com/prometheus/prometheus/com_github_prometheus_prometheus-v0.50.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/prometheus/prometheus/com_github_prometheus_prometheus-v0.50.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/prometheus/prometheus/com_github_prometheus_prometheus-v0.50.1.zip",
        ],
    )
    go_repository(
        name = "com_github_qri_io_jsonpointer",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/qri-io/jsonpointer",
        sha256 = "6870d4b9fc5ac8efb9226447975fecfb07241133e23c7e661f5aac1a3088f338",
        strip_prefix = "github.com/qri-io/jsonpointer@v0.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/qri-io/jsonpointer/com_github_qri_io_jsonpointer-v0.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/qri-io/jsonpointer/com_github_qri_io_jsonpointer-v0.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/qri-io/jsonpointer/com_github_qri_io_jsonpointer-v0.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/qri-io/jsonpointer/com_github_qri_io_jsonpointer-v0.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_qri_io_jsonschema",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/qri-io/jsonschema",
        sha256 = "51305cc45fd383b24de94e2eb421ffba8d83679520c18348842c4255025c5940",
        strip_prefix = "github.com/qri-io/jsonschema@v0.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/qri-io/jsonschema/com_github_qri_io_jsonschema-v0.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/qri-io/jsonschema/com_github_qri_io_jsonschema-v0.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/qri-io/jsonschema/com_github_qri_io_jsonschema-v0.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/qri-io/jsonschema/com_github_qri_io_jsonschema-v0.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_quasilyte_go_ruleguard",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/quasilyte/go-ruleguard",
        sha256 = "f4b71241fa9cb978911a835bceb05cbf32969cb1673b58312aa211272d59ef79",
        strip_prefix = "github.com/quasilyte/go-ruleguard@v0.4.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/quasilyte/go-ruleguard/com_github_quasilyte_go_ruleguard-v0.4.4.zip",
            "http://ats.apps.svc/gomod/github.com/quasilyte/go-ruleguard/com_github_quasilyte_go_ruleguard-v0.4.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/quasilyte/go-ruleguard/com_github_quasilyte_go_ruleguard-v0.4.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/quasilyte/go-ruleguard/com_github_quasilyte_go_ruleguard-v0.4.4.zip",
        ],
    )
    go_repository(
        name = "com_github_quasilyte_go_ruleguard_dsl",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/quasilyte/go-ruleguard/dsl",
        sha256 = "8770b31a1a936d800b61064c5d7684bbd57923ad51254e2507eaa04c8b75e5c1",
        strip_prefix = "github.com/quasilyte/go-ruleguard/dsl@v0.3.22",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/quasilyte/go-ruleguard/dsl/com_github_quasilyte_go_ruleguard_dsl-v0.3.22.zip",
            "http://ats.apps.svc/gomod/github.com/quasilyte/go-ruleguard/dsl/com_github_quasilyte_go_ruleguard_dsl-v0.3.22.zip",
            "https://cache.hawkingrei.com/gomod/github.com/quasilyte/go-ruleguard/dsl/com_github_quasilyte_go_ruleguard_dsl-v0.3.22.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/quasilyte/go-ruleguard/dsl/com_github_quasilyte_go_ruleguard_dsl-v0.3.22.zip",
        ],
    )
    go_repository(
        name = "com_github_quasilyte_gogrep",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/quasilyte/gogrep",
        sha256 = "1829fbd111ee3f64ac594e8bfb7e7fcf8d89a2fc2e6563ebec3e33d677240b4f",
        strip_prefix = "github.com/quasilyte/gogrep@v0.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/quasilyte/gogrep/com_github_quasilyte_gogrep-v0.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/quasilyte/gogrep/com_github_quasilyte_gogrep-v0.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/quasilyte/gogrep/com_github_quasilyte_gogrep-v0.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/quasilyte/gogrep/com_github_quasilyte_gogrep-v0.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_quasilyte_regex_syntax",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/quasilyte/regex/syntax",
        sha256 = "59e43fa28684f36048d17ac869c87b145eae14c591625a18036b51be94b11f6d",
        strip_prefix = "github.com/quasilyte/regex/syntax@v0.0.0-20210819130434-b3f0c404a727",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/quasilyte/regex/syntax/com_github_quasilyte_regex_syntax-v0.0.0-20210819130434-b3f0c404a727.zip",
            "http://ats.apps.svc/gomod/github.com/quasilyte/regex/syntax/com_github_quasilyte_regex_syntax-v0.0.0-20210819130434-b3f0c404a727.zip",
            "https://cache.hawkingrei.com/gomod/github.com/quasilyte/regex/syntax/com_github_quasilyte_regex_syntax-v0.0.0-20210819130434-b3f0c404a727.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/quasilyte/regex/syntax/com_github_quasilyte_regex_syntax-v0.0.0-20210819130434-b3f0c404a727.zip",
        ],
    )
    go_repository(
        name = "com_github_quasilyte_stdinfo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/quasilyte/stdinfo",
        sha256 = "d411dd9c4a34df4cf217d9f0f05f45e3b6ef7deed6bdfbdd36aa4015646d5373",
        strip_prefix = "github.com/quasilyte/stdinfo@v0.0.0-20220114132959-f7386bf02567",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/quasilyte/stdinfo/com_github_quasilyte_stdinfo-v0.0.0-20220114132959-f7386bf02567.zip",
            "http://ats.apps.svc/gomod/github.com/quasilyte/stdinfo/com_github_quasilyte_stdinfo-v0.0.0-20220114132959-f7386bf02567.zip",
            "https://cache.hawkingrei.com/gomod/github.com/quasilyte/stdinfo/com_github_quasilyte_stdinfo-v0.0.0-20220114132959-f7386bf02567.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/quasilyte/stdinfo/com_github_quasilyte_stdinfo-v0.0.0-20220114132959-f7386bf02567.zip",
        ],
    )
    go_repository(
        name = "com_github_raeperd_recvcheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/raeperd/recvcheck",
        sha256 = "208bf632200468a678b264df7a172e9edf327a13a94e56e8ed58ce55364c7558",
        strip_prefix = "github.com/raeperd/recvcheck@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/raeperd/recvcheck/com_github_raeperd_recvcheck-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/raeperd/recvcheck/com_github_raeperd_recvcheck-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/raeperd/recvcheck/com_github_raeperd_recvcheck-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/raeperd/recvcheck/com_github_raeperd_recvcheck-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_remyoudompheng_bigfft",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/remyoudompheng/bigfft",
        sha256 = "9be16c32c384d55d0f7bd7b03f1ff1e9a4e4b91b000f0aa87a567a01b9b82398",
        strip_prefix = "github.com/remyoudompheng/bigfft@v0.0.0-20230129092748-24d4a6f8daec",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/remyoudompheng/bigfft/com_github_remyoudompheng_bigfft-v0.0.0-20230129092748-24d4a6f8daec.zip",
            "http://ats.apps.svc/gomod/github.com/remyoudompheng/bigfft/com_github_remyoudompheng_bigfft-v0.0.0-20230129092748-24d4a6f8daec.zip",
            "https://cache.hawkingrei.com/gomod/github.com/remyoudompheng/bigfft/com_github_remyoudompheng_bigfft-v0.0.0-20230129092748-24d4a6f8daec.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/remyoudompheng/bigfft/com_github_remyoudompheng_bigfft-v0.0.0-20230129092748-24d4a6f8daec.zip",
        ],
    )
    go_repository(
        name = "com_github_rivo_uniseg",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/rivo/uniseg",
        sha256 = "b995e4aa0cc1e5779cc61138ac925cb8c1e963e40c80e4b93ee8553812ebb792",
        strip_prefix = "github.com/rivo/uniseg@v0.4.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/rivo/uniseg/com_github_rivo_uniseg-v0.4.7.zip",
            "http://ats.apps.svc/gomod/github.com/rivo/uniseg/com_github_rivo_uniseg-v0.4.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/rivo/uniseg/com_github_rivo_uniseg-v0.4.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/rivo/uniseg/com_github_rivo_uniseg-v0.4.7.zip",
        ],
    )
    go_repository(
        name = "com_github_robfig_cron_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/robfig/cron/v3",
        sha256 = "ebe6454642220832a451b8cc50eae5f9150fd8d36b90b242a5de27676be86c70",
        strip_prefix = "github.com/robfig/cron/v3@v3.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/robfig/cron/v3/com_github_robfig_cron_v3-v3.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/robfig/cron/v3/com_github_robfig_cron_v3-v3.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/robfig/cron/v3/com_github_robfig_cron_v3-v3.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/robfig/cron/v3/com_github_robfig_cron_v3-v3.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_rogpeppe_fastuuid",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/rogpeppe/fastuuid",
        sha256 = "f9b8293f5e20270e26fb4214ca7afec864de92c73d03ff62b5ee29d1db4e72a1",
        strip_prefix = "github.com/rogpeppe/fastuuid@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/rogpeppe/fastuuid/com_github_rogpeppe_fastuuid-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/rogpeppe/fastuuid/com_github_rogpeppe_fastuuid-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/rogpeppe/fastuuid/com_github_rogpeppe_fastuuid-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/rogpeppe/fastuuid/com_github_rogpeppe_fastuuid-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_rogpeppe_go_internal",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/rogpeppe/go-internal",
        sha256 = "ab3d18283cef2f46ddfd489b6b14b970eb7dbbb642786f025ee1ac5291dc4e70",
        strip_prefix = "github.com/rogpeppe/go-internal@v1.14.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/rogpeppe/go-internal/com_github_rogpeppe_go_internal-v1.14.1.zip",
            "http://ats.apps.svc/gomod/github.com/rogpeppe/go-internal/com_github_rogpeppe_go_internal-v1.14.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/rogpeppe/go-internal/com_github_rogpeppe_go_internal-v1.14.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/rogpeppe/go-internal/com_github_rogpeppe_go_internal-v1.14.1.zip",
        ],
    )
    go_repository(
        name = "com_github_russross_blackfriday",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/russross/blackfriday",
        sha256 = "ba3408459608d91f693cffe853d2169116b8327c0f3c5d42e3818f43e41d1c87",
        strip_prefix = "github.com/russross/blackfriday@v1.5.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/russross/blackfriday/com_github_russross_blackfriday-v1.5.2.zip",
            "http://ats.apps.svc/gomod/github.com/russross/blackfriday/com_github_russross_blackfriday-v1.5.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/russross/blackfriday/com_github_russross_blackfriday-v1.5.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/russross/blackfriday/com_github_russross_blackfriday-v1.5.2.zip",
        ],
    )
    go_repository(
        name = "com_github_russross_blackfriday_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/russross/blackfriday/v2",
        sha256 = "7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae",
        strip_prefix = "github.com/russross/blackfriday/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/russross/blackfriday/v2/com_github_russross_blackfriday_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/russross/blackfriday/v2/com_github_russross_blackfriday_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/russross/blackfriday/v2/com_github_russross_blackfriday_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/russross/blackfriday/v2/com_github_russross_blackfriday_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ruudk_golang_pdf417",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ruudk/golang-pdf417",
        sha256 = "f0006c0f60789da76c1b3fef73bb63f5581744fbe3ab5973ec718b40c6822f69",
        strip_prefix = "github.com/ruudk/golang-pdf417@v0.0.0-20201230142125-a7e3863a1245",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ruudk/golang-pdf417/com_github_ruudk_golang_pdf417-v0.0.0-20201230142125-a7e3863a1245.zip",
            "http://ats.apps.svc/gomod/github.com/ruudk/golang-pdf417/com_github_ruudk_golang_pdf417-v0.0.0-20201230142125-a7e3863a1245.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ruudk/golang-pdf417/com_github_ruudk_golang_pdf417-v0.0.0-20201230142125-a7e3863a1245.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ruudk/golang-pdf417/com_github_ruudk_golang_pdf417-v0.0.0-20201230142125-a7e3863a1245.zip",
        ],
    )
    go_repository(
        name = "com_github_ryancurrah_gomodguard",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ryancurrah/gomodguard",
        sha256 = "b0dcb18a47627fa4968c9c68e4b529049da261fe60a1728e543bf46f41cdbcd8",
        strip_prefix = "github.com/ryancurrah/gomodguard@v1.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ryancurrah/gomodguard/com_github_ryancurrah_gomodguard-v1.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/ryancurrah/gomodguard/com_github_ryancurrah_gomodguard-v1.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ryancurrah/gomodguard/com_github_ryancurrah_gomodguard-v1.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ryancurrah/gomodguard/com_github_ryancurrah_gomodguard-v1.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ryanrolds_sqlclosecheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ryanrolds/sqlclosecheck",
        sha256 = "fdfe57b2a9d1b22c756acefaf4b9c254e1437e8d6ec7eb3400a8cb379a06a11b",
        strip_prefix = "github.com/ryanrolds/sqlclosecheck@v0.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ryanrolds/sqlclosecheck/com_github_ryanrolds_sqlclosecheck-v0.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/ryanrolds/sqlclosecheck/com_github_ryanrolds_sqlclosecheck-v0.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ryanrolds/sqlclosecheck/com_github_ryanrolds_sqlclosecheck-v0.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ryanrolds/sqlclosecheck/com_github_ryanrolds_sqlclosecheck-v0.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_ryszard_goskiplist",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ryszard/goskiplist",
        sha256 = "12c65729fc31d5a9bf246eb387bd4c268d0d68bf33b913cccd81bebd47d6f80d",
        strip_prefix = "github.com/ryszard/goskiplist@v0.0.0-20150312221310-2dfbae5fcf46",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ryszard/goskiplist/com_github_ryszard_goskiplist-v0.0.0-20150312221310-2dfbae5fcf46.zip",
            "http://ats.apps.svc/gomod/github.com/ryszard/goskiplist/com_github_ryszard_goskiplist-v0.0.0-20150312221310-2dfbae5fcf46.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ryszard/goskiplist/com_github_ryszard_goskiplist-v0.0.0-20150312221310-2dfbae5fcf46.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ryszard/goskiplist/com_github_ryszard_goskiplist-v0.0.0-20150312221310-2dfbae5fcf46.zip",
        ],
    )
    go_repository(
        name = "com_github_sanposhiho_wastedassign_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sanposhiho/wastedassign/v2",
        sha256 = "5e131010d3463e2ae1c25ddb0740f3c9dd0054194eda1874ddd272b10843bc37",
        strip_prefix = "github.com/sanposhiho/wastedassign/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sanposhiho/wastedassign/v2/com_github_sanposhiho_wastedassign_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/sanposhiho/wastedassign/v2/com_github_sanposhiho_wastedassign_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sanposhiho/wastedassign/v2/com_github_sanposhiho_wastedassign_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sanposhiho/wastedassign/v2/com_github_sanposhiho_wastedassign_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_santhosh_tekuri_jsonschema_v6",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/santhosh-tekuri/jsonschema/v6",
        sha256 = "fe5eb88614e560d2072d1f95708ac217b6cb047789531ad633114ec277338635",
        strip_prefix = "github.com/santhosh-tekuri/jsonschema/v6@v6.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/santhosh-tekuri/jsonschema/v6/com_github_santhosh_tekuri_jsonschema_v6-v6.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/santhosh-tekuri/jsonschema/v6/com_github_santhosh_tekuri_jsonschema_v6-v6.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/santhosh-tekuri/jsonschema/v6/com_github_santhosh_tekuri_jsonschema_v6-v6.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/santhosh-tekuri/jsonschema/v6/com_github_santhosh_tekuri_jsonschema_v6-v6.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_sasha_s_go_deadlock",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sasha-s/go-deadlock",
        sha256 = "b927f67dd9a6dc183bac7249c019775e689aee67dc52bfa53354137139d722a1",
        strip_prefix = "github.com/sasha-s/go-deadlock@v0.3.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sasha-s/go-deadlock/com_github_sasha_s_go_deadlock-v0.3.5.zip",
            "http://ats.apps.svc/gomod/github.com/sasha-s/go-deadlock/com_github_sasha_s_go_deadlock-v0.3.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sasha-s/go-deadlock/com_github_sasha_s_go_deadlock-v0.3.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sasha-s/go-deadlock/com_github_sasha_s_go_deadlock-v0.3.5.zip",
        ],
    )
    go_repository(
        name = "com_github_sashamelentyev_interfacebloat",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sashamelentyev/interfacebloat",
        sha256 = "a1bd04f014594596e85a8d6fff2eb65a64cb9f05a83ed4766b76c3db74d7123a",
        strip_prefix = "github.com/sashamelentyev/interfacebloat@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sashamelentyev/interfacebloat/com_github_sashamelentyev_interfacebloat-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/sashamelentyev/interfacebloat/com_github_sashamelentyev_interfacebloat-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sashamelentyev/interfacebloat/com_github_sashamelentyev_interfacebloat-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sashamelentyev/interfacebloat/com_github_sashamelentyev_interfacebloat-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_sashamelentyev_usestdlibvars",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sashamelentyev/usestdlibvars",
        sha256 = "75cbf94048adde6c04821a1d2adc02eacd8251c16cc53a0b34e455c3a2836be9",
        strip_prefix = "github.com/sashamelentyev/usestdlibvars@v1.29.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sashamelentyev/usestdlibvars/com_github_sashamelentyev_usestdlibvars-v1.29.0.zip",
            "http://ats.apps.svc/gomod/github.com/sashamelentyev/usestdlibvars/com_github_sashamelentyev_usestdlibvars-v1.29.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sashamelentyev/usestdlibvars/com_github_sashamelentyev_usestdlibvars-v1.29.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sashamelentyev/usestdlibvars/com_github_sashamelentyev_usestdlibvars-v1.29.0.zip",
        ],
    )
    go_repository(
        name = "com_github_scaleway_scaleway_sdk_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/scaleway/scaleway-sdk-go",
        sha256 = "b7f9a702ee1e899d81bc23ca5e761cd2bc6c0202797d9b5193b83a50bad16698",
        strip_prefix = "github.com/scaleway/scaleway-sdk-go@v1.0.0-beta.22",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/scaleway/scaleway-sdk-go/com_github_scaleway_scaleway_sdk_go-v1.0.0-beta.22.zip",
            "http://ats.apps.svc/gomod/github.com/scaleway/scaleway-sdk-go/com_github_scaleway_scaleway_sdk_go-v1.0.0-beta.22.zip",
            "https://cache.hawkingrei.com/gomod/github.com/scaleway/scaleway-sdk-go/com_github_scaleway_scaleway_sdk_go-v1.0.0-beta.22.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/scaleway/scaleway-sdk-go/com_github_scaleway_scaleway_sdk_go-v1.0.0-beta.22.zip",
        ],
    )
    go_repository(
        name = "com_github_schollz_closestmatch",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/schollz/closestmatch",
        sha256 = "f267729efc7a639bb816e2586a17237a8c8e7ff327c0c3dd58766d1433ad2d3a",
        strip_prefix = "github.com/schollz/closestmatch@v2.1.0+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/schollz/closestmatch/com_github_schollz_closestmatch-v2.1.0+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/schollz/closestmatch/com_github_schollz_closestmatch-v2.1.0+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/schollz/closestmatch/com_github_schollz_closestmatch-v2.1.0+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/schollz/closestmatch/com_github_schollz_closestmatch-v2.1.0+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_securego_gosec_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/securego/gosec/v2",
        sha256 = "51a3313653b0795a2f708555d947308368e90daec0fa743f74960f75727a7958",
        strip_prefix = "github.com/securego/gosec/v2@v2.22.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/securego/gosec/v2/com_github_securego_gosec_v2-v2.22.6.zip",
            "http://ats.apps.svc/gomod/github.com/securego/gosec/v2/com_github_securego_gosec_v2-v2.22.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/securego/gosec/v2/com_github_securego_gosec_v2-v2.22.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/securego/gosec/v2/com_github_securego_gosec_v2-v2.22.6.zip",
        ],
    )
    go_repository(
        name = "com_github_segmentio_asm",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/segmentio/asm",
        sha256 = "8e2815672f1ab3049b10185b5494006320c32afb419ccf9f14385bc25ea44def",
        strip_prefix = "github.com/segmentio/asm@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/segmentio/asm/com_github_segmentio_asm-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/segmentio/asm/com_github_segmentio_asm-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/segmentio/asm/com_github_segmentio_asm-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/segmentio/asm/com_github_segmentio_asm-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_segmentio_fasthash",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/segmentio/fasthash",
        sha256 = "fe6b87a2841eac3670539d105692d39f67155955202145dc78f3a29c866b8cb6",
        strip_prefix = "github.com/segmentio/fasthash@v1.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/segmentio/fasthash/com_github_segmentio_fasthash-v1.0.3.zip",
            "http://ats.apps.svc/gomod/github.com/segmentio/fasthash/com_github_segmentio_fasthash-v1.0.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/segmentio/fasthash/com_github_segmentio_fasthash-v1.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/segmentio/fasthash/com_github_segmentio_fasthash-v1.0.3.zip",
        ],
    )
    go_repository(
        name = "com_github_sergi_go_diff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sergi/go-diff",
        sha256 = "a9c0203d5188745f59c29e170e8b1a7e7c8bd007634bce75932ffac042e43eac",
        strip_prefix = "github.com/sergi/go-diff@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sergi/go-diff/com_github_sergi_go_diff-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/sergi/go-diff/com_github_sergi_go_diff-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sergi/go-diff/com_github_sergi_go_diff-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sergi/go-diff/com_github_sergi_go_diff-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_shabbyrobe_gocovmerge",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shabbyrobe/gocovmerge",
        sha256 = "3c4cbe51a4350af0f4f042034e5b27470e7df81c842fb22d13cb73cdcba31b66",
        strip_prefix = "github.com/shabbyrobe/gocovmerge@v0.0.0-20190829150210-3e036491d500",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shabbyrobe/gocovmerge/com_github_shabbyrobe_gocovmerge-v0.0.0-20190829150210-3e036491d500.zip",
            "http://ats.apps.svc/gomod/github.com/shabbyrobe/gocovmerge/com_github_shabbyrobe_gocovmerge-v0.0.0-20190829150210-3e036491d500.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shabbyrobe/gocovmerge/com_github_shabbyrobe_gocovmerge-v0.0.0-20190829150210-3e036491d500.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shabbyrobe/gocovmerge/com_github_shabbyrobe_gocovmerge-v0.0.0-20190829150210-3e036491d500.zip",
        ],
    )
    go_repository(
        name = "com_github_shirou_gopsutil_v3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shirou/gopsutil/v3",
        sha256 = "95ae6f59bf23d3400d96bdd3b8c84117effbd59cfab6ab37bd667d4b0ed79518",
        strip_prefix = "github.com/shirou/gopsutil/v3@v3.24.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shirou/gopsutil/v3/com_github_shirou_gopsutil_v3-v3.24.5.zip",
            "http://ats.apps.svc/gomod/github.com/shirou/gopsutil/v3/com_github_shirou_gopsutil_v3-v3.24.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shirou/gopsutil/v3/com_github_shirou_gopsutil_v3-v3.24.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shirou/gopsutil/v3/com_github_shirou_gopsutil_v3-v3.24.5.zip",
        ],
    )
    go_repository(
        name = "com_github_shirou_gopsutil_v4",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shirou/gopsutil/v4",
        sha256 = "a613e729daf8af002067ab02a6159aa53c00f659919e71e28fec78f373cad3c0",
        strip_prefix = "github.com/shirou/gopsutil/v4@v4.25.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shirou/gopsutil/v4/com_github_shirou_gopsutil_v4-v4.25.6.zip",
            "http://ats.apps.svc/gomod/github.com/shirou/gopsutil/v4/com_github_shirou_gopsutil_v4-v4.25.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shirou/gopsutil/v4/com_github_shirou_gopsutil_v4-v4.25.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shirou/gopsutil/v4/com_github_shirou_gopsutil_v4-v4.25.6.zip",
        ],
    )
    go_repository(
        name = "com_github_shoenig_go_m1cpu",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shoenig/go-m1cpu",
        sha256 = "0ceab2ec73ef7d1291bd7663dd39203ee7037ee9dccb6fc3381ad819bd8550d1",
        strip_prefix = "github.com/shoenig/go-m1cpu@v0.1.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shoenig/go-m1cpu/com_github_shoenig_go_m1cpu-v0.1.6.zip",
            "http://ats.apps.svc/gomod/github.com/shoenig/go-m1cpu/com_github_shoenig_go_m1cpu-v0.1.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shoenig/go-m1cpu/com_github_shoenig_go_m1cpu-v0.1.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shoenig/go-m1cpu/com_github_shoenig_go_m1cpu-v0.1.6.zip",
        ],
    )
    go_repository(
        name = "com_github_shoenig_test",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shoenig/test",
        sha256 = "c2f3912a0f4bb15e24d2c61beb63bd3093aafafb033c1ab71c0918c352df0781",
        strip_prefix = "github.com/shoenig/test@v0.6.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shoenig/test/com_github_shoenig_test-v0.6.4.zip",
            "http://ats.apps.svc/gomod/github.com/shoenig/test/com_github_shoenig_test-v0.6.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shoenig/test/com_github_shoenig_test-v0.6.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shoenig/test/com_github_shoenig_test-v0.6.4.zip",
        ],
    )
    go_repository(
        name = "com_github_shopify_goreferrer",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/Shopify/goreferrer",
        sha256 = "280a2f55812e8b475cfd9d467a3b3d5859315788e68592a8fc5d6cedadc0503f",
        strip_prefix = "github.com/Shopify/goreferrer@v0.0.0-20220729165902-8cddb4f5de06",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/Shopify/goreferrer/com_github_shopify_goreferrer-v0.0.0-20220729165902-8cddb4f5de06.zip",
            "http://ats.apps.svc/gomod/github.com/Shopify/goreferrer/com_github_shopify_goreferrer-v0.0.0-20220729165902-8cddb4f5de06.zip",
            "https://cache.hawkingrei.com/gomod/github.com/Shopify/goreferrer/com_github_shopify_goreferrer-v0.0.0-20220729165902-8cddb4f5de06.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/Shopify/goreferrer/com_github_shopify_goreferrer-v0.0.0-20220729165902-8cddb4f5de06.zip",
        ],
    )
    go_repository(
        name = "com_github_shopspring_decimal",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shopspring/decimal",
        sha256 = "65c34c248e7f736cadf03a7caa0c0870d15499eb593f933fe106c96c2b7699a7",
        strip_prefix = "github.com/shopspring/decimal@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shopspring/decimal/com_github_shopspring_decimal-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/shopspring/decimal/com_github_shopspring_decimal-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shopspring/decimal/com_github_shopspring_decimal-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shopspring/decimal/com_github_shopspring_decimal-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_shurcool_httpfs",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shurcooL/httpfs",
        sha256 = "4b3bea8ded4d221b448bf34d21cfe0b84d60faa71aa21ac2664c67009365d7f6",
        strip_prefix = "github.com/shurcooL/httpfs@v0.0.0-20230704072500-f1e31cf0ba5c",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shurcooL/httpfs/com_github_shurcool_httpfs-v0.0.0-20230704072500-f1e31cf0ba5c.zip",
            "http://ats.apps.svc/gomod/github.com/shurcooL/httpfs/com_github_shurcool_httpfs-v0.0.0-20230704072500-f1e31cf0ba5c.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shurcooL/httpfs/com_github_shurcool_httpfs-v0.0.0-20230704072500-f1e31cf0ba5c.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shurcooL/httpfs/com_github_shurcool_httpfs-v0.0.0-20230704072500-f1e31cf0ba5c.zip",
        ],
    )
    go_repository(
        name = "com_github_shurcool_httpgzip",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shurcooL/httpgzip",
        sha256 = "70ef73fce2f89d622f828cb439fd6c7b48a7fe63600410a8c0a936042c0e4631",
        strip_prefix = "github.com/shurcooL/httpgzip@v0.0.0-20190720172056-320755c1c1b0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shurcooL/httpgzip/com_github_shurcool_httpgzip-v0.0.0-20190720172056-320755c1c1b0.zip",
            "http://ats.apps.svc/gomod/github.com/shurcooL/httpgzip/com_github_shurcool_httpgzip-v0.0.0-20190720172056-320755c1c1b0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shurcooL/httpgzip/com_github_shurcool_httpgzip-v0.0.0-20190720172056-320755c1c1b0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shurcooL/httpgzip/com_github_shurcool_httpgzip-v0.0.0-20190720172056-320755c1c1b0.zip",
        ],
    )
    go_repository(
        name = "com_github_shurcool_vfsgen",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/shurcooL/vfsgen",
        sha256 = "8a093681b21159514a1742b1a49e88fa2cf562673a5a0055e9abeb7ff590ee19",
        strip_prefix = "github.com/shurcooL/vfsgen@v0.0.0-20181202132449-6a9ea43bcacd",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/shurcooL/vfsgen/com_github_shurcool_vfsgen-v0.0.0-20181202132449-6a9ea43bcacd.zip",
            "http://ats.apps.svc/gomod/github.com/shurcooL/vfsgen/com_github_shurcool_vfsgen-v0.0.0-20181202132449-6a9ea43bcacd.zip",
            "https://cache.hawkingrei.com/gomod/github.com/shurcooL/vfsgen/com_github_shurcool_vfsgen-v0.0.0-20181202132449-6a9ea43bcacd.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/shurcooL/vfsgen/com_github_shurcool_vfsgen-v0.0.0-20181202132449-6a9ea43bcacd.zip",
        ],
    )
    go_repository(
        name = "com_github_sirupsen_logrus",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sirupsen/logrus",
        sha256 = "4501f4e6b858bfdd997671fcdd2f647a3178b29b6b4d1344caa7c07517121dd0",
        strip_prefix = "github.com/sirupsen/logrus@v1.9.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sirupsen/logrus/com_github_sirupsen_logrus-v1.9.3.zip",
            "http://ats.apps.svc/gomod/github.com/sirupsen/logrus/com_github_sirupsen_logrus-v1.9.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sirupsen/logrus/com_github_sirupsen_logrus-v1.9.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sirupsen/logrus/com_github_sirupsen_logrus-v1.9.3.zip",
        ],
    )
    go_repository(
        name = "com_github_sivchari_containedctx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sivchari/containedctx",
        sha256 = "d765afffc476a51173fa7622e44db9054c1467b85d024b03b5148c42b9182f60",
        strip_prefix = "github.com/sivchari/containedctx@v1.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sivchari/containedctx/com_github_sivchari_containedctx-v1.0.3.zip",
            "http://ats.apps.svc/gomod/github.com/sivchari/containedctx/com_github_sivchari_containedctx-v1.0.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sivchari/containedctx/com_github_sivchari_containedctx-v1.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sivchari/containedctx/com_github_sivchari_containedctx-v1.0.3.zip",
        ],
    )
    go_repository(
        name = "com_github_soheilhy_cmux",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/soheilhy/cmux",
        sha256 = "27ae4f072970e4d09f4ecc75951b6cbc4dcf607da9ace4df4fb5a7a5f69054c0",
        strip_prefix = "github.com/soheilhy/cmux@v0.1.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/soheilhy/cmux/com_github_soheilhy_cmux-v0.1.5.zip",
            "http://ats.apps.svc/gomod/github.com/soheilhy/cmux/com_github_soheilhy_cmux-v0.1.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/soheilhy/cmux/com_github_soheilhy_cmux-v0.1.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/soheilhy/cmux/com_github_soheilhy_cmux-v0.1.5.zip",
        ],
    )
    go_repository(
        name = "com_github_sonatard_noctx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sonatard/noctx",
        sha256 = "1858eac7c4ed82396bf2fd63ae9862317e9ecf80d2d28bb75f730564199d37dd",
        strip_prefix = "github.com/sonatard/noctx@v0.3.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sonatard/noctx/com_github_sonatard_noctx-v0.3.5.zip",
            "http://ats.apps.svc/gomod/github.com/sonatard/noctx/com_github_sonatard_noctx-v0.3.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sonatard/noctx/com_github_sonatard_noctx-v0.3.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sonatard/noctx/com_github_sonatard_noctx-v0.3.5.zip",
        ],
    )
    go_repository(
        name = "com_github_sourcegraph_go_diff",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/sourcegraph/go-diff",
        sha256 = "893c60e8d7b38e88f029d560cb2bc5ce8402631b25e4bdd8f6d371f9a397b140",
        strip_prefix = "github.com/sourcegraph/go-diff@v0.7.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sourcegraph/go-diff/com_github_sourcegraph_go_diff-v0.7.0.zip",
            "http://ats.apps.svc/gomod/github.com/sourcegraph/go-diff/com_github_sourcegraph_go_diff-v0.7.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sourcegraph/go-diff/com_github_sourcegraph_go_diff-v0.7.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sourcegraph/go-diff/com_github_sourcegraph_go_diff-v0.7.0.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_afero",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/afero",
        sha256 = "eec827dee35b23df42f757c5f73841d388951ee6cd49cc14d724e48c4e04d140",
        strip_prefix = "github.com/spf13/afero@v1.14.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/afero/com_github_spf13_afero-v1.14.0.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/afero/com_github_spf13_afero-v1.14.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/afero/com_github_spf13_afero-v1.14.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/afero/com_github_spf13_afero-v1.14.0.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_cast",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/cast",
        sha256 = "0d6f70dc849ce1e56f2b50ceeac0a7eec9dd2b8414b556ad183a35cc5c84342a",
        strip_prefix = "github.com/spf13/cast@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/cast/com_github_spf13_cast-v1.5.0.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/cast/com_github_spf13_cast-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/cast/com_github_spf13_cast-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/cast/com_github_spf13_cast-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_cobra",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/cobra",
        sha256 = "e44a319d167f096bd3ba0bd0c13cf17d8dc0b7d51ac784fa7440d005dd2ed5cb",
        strip_prefix = "github.com/spf13/cobra@v1.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/cobra/com_github_spf13_cobra-v1.9.1.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/cobra/com_github_spf13_cobra-v1.9.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/cobra/com_github_spf13_cobra-v1.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/cobra/com_github_spf13_cobra-v1.9.1.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_jwalterweatherman",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/jwalterweatherman",
        sha256 = "43cc5f056caf66dc8225dca36637bfc18509521b103a69ca76fbc2b6519194a3",
        strip_prefix = "github.com/spf13/jwalterweatherman@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/jwalterweatherman/com_github_spf13_jwalterweatherman-v1.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/jwalterweatherman/com_github_spf13_jwalterweatherman-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/jwalterweatherman/com_github_spf13_jwalterweatherman-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/jwalterweatherman/com_github_spf13_jwalterweatherman-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_pflag",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/pflag",
        sha256 = "dca1daf09c8d99e5487b3feab60ab47e46d4c26267d1882fe93318d26e0f9e8d",
        strip_prefix = "github.com/spf13/pflag@v1.0.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/pflag/com_github_spf13_pflag-v1.0.7.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/pflag/com_github_spf13_pflag-v1.0.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/pflag/com_github_spf13_pflag-v1.0.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/pflag/com_github_spf13_pflag-v1.0.7.zip",
        ],
    )
    go_repository(
        name = "com_github_spf13_viper",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spf13/viper",
        sha256 = "51dcee7805a5d57f5c12fcc7be630045823d522cfab2b8436b4e595fc784108c",
        strip_prefix = "github.com/spf13/viper@v1.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spf13/viper/com_github_spf13_viper-v1.12.0.zip",
            "http://ats.apps.svc/gomod/github.com/spf13/viper/com_github_spf13_viper-v1.12.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spf13/viper/com_github_spf13_viper-v1.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spf13/viper/com_github_spf13_viper-v1.12.0.zip",
        ],
    )
    go_repository(
        name = "com_github_spkg_bom",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/spkg/bom",
        sha256 = "e920b03c06974b4676684dca3d498ed20dfd1f7b995d704dc48eecf63101fc26",
        strip_prefix = "github.com/spkg/bom@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/spkg/bom/com_github_spkg_bom-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/spkg/bom/com_github_spkg_bom-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/spkg/bom/com_github_spkg_bom-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/spkg/bom/com_github_spkg_bom-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ssgreg_nlreturn_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ssgreg/nlreturn/v2",
        sha256 = "0a1fdd4b7568deafbd5b8a28fef8ae0145cc1bc66365b03ebba542f6d2cfdd35",
        strip_prefix = "github.com/ssgreg/nlreturn/v2@v2.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ssgreg/nlreturn/v2/com_github_ssgreg_nlreturn_v2-v2.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/ssgreg/nlreturn/v2/com_github_ssgreg_nlreturn_v2-v2.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ssgreg/nlreturn/v2/com_github_ssgreg_nlreturn_v2-v2.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ssgreg/nlreturn/v2/com_github_ssgreg_nlreturn_v2-v2.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_stathat_consistent",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stathat/consistent",
        sha256 = "4e890b0a4d0fea70e2c8107c13af64029bfea8c0bd9ba7a97a105b84b263caaa",
        strip_prefix = "github.com/stathat/consistent@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/stathat/consistent/com_github_stathat_consistent-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/stathat/consistent/com_github_stathat_consistent-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/stathat/consistent/com_github_stathat_consistent-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/stathat/consistent/com_github_stathat_consistent-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_stbenjam_no_sprintf_host_port",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stbenjam/no-sprintf-host-port",
        sha256 = "a71ec23eb75da30b7479be91f8caa4cf785c5a202950ccf70e367a250f60c096",
        strip_prefix = "github.com/stbenjam/no-sprintf-host-port@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/stbenjam/no-sprintf-host-port/com_github_stbenjam_no_sprintf_host_port-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/stbenjam/no-sprintf-host-port/com_github_stbenjam_no_sprintf_host_port-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/stbenjam/no-sprintf-host-port/com_github_stbenjam_no_sprintf_host_port-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/stbenjam/no-sprintf-host-port/com_github_stbenjam_no_sprintf_host_port-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_stretchr_objx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stretchr/objx",
        sha256 = "3c22c1d1c4c4024eb16a12f0187775640bf35d51b0a06649febc7797119451c0",
        strip_prefix = "github.com/stretchr/objx@v0.5.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/stretchr/objx/com_github_stretchr_objx-v0.5.2.zip",
            "http://ats.apps.svc/gomod/github.com/stretchr/objx/com_github_stretchr_objx-v0.5.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/stretchr/objx/com_github_stretchr_objx-v0.5.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/stretchr/objx/com_github_stretchr_objx-v0.5.2.zip",
        ],
    )
    go_repository(
        name = "com_github_stretchr_testify",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/stretchr/testify",
        sha256 = "36c87573527a97ce97fc15ce2a101e65e5ebb350db142d09f633580cb8d5c839",
        strip_prefix = "github.com/stretchr/testify@v1.10.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/stretchr/testify/com_github_stretchr_testify-v1.10.0.zip",
            "http://ats.apps.svc/gomod/github.com/stretchr/testify/com_github_stretchr_testify-v1.10.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/stretchr/testify/com_github_stretchr_testify-v1.10.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/stretchr/testify/com_github_stretchr_testify-v1.10.0.zip",
        ],
    )
    go_repository(
        name = "com_github_subosito_gotenv",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/subosito/gotenv",
        sha256 = "8a4468ab0e49d730116acd47911ebfa217e8237707bf7662671f10864be24372",
        strip_prefix = "github.com/subosito/gotenv@v1.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/subosito/gotenv/com_github_subosito_gotenv-v1.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/subosito/gotenv/com_github_subosito_gotenv-v1.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/subosito/gotenv/com_github_subosito_gotenv-v1.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/subosito/gotenv/com_github_subosito_gotenv-v1.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tdakkota_asciicheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tdakkota/asciicheck",
        sha256 = "1bc4ac6afaff5165b2f0565c6c1e8b1f7fc7e1000cb4fb7832eef7bb2cc61e4e",
        strip_prefix = "github.com/tdakkota/asciicheck@v0.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tdakkota/asciicheck/com_github_tdakkota_asciicheck-v0.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/tdakkota/asciicheck/com_github_tdakkota_asciicheck-v0.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tdakkota/asciicheck/com_github_tdakkota_asciicheck-v0.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tdakkota/asciicheck/com_github_tdakkota_asciicheck-v0.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tdewolff_minify_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tdewolff/minify/v2",
        sha256 = "6f76f152c15fee3a36b0496175d7e075046c3b47b50327428b10d32af6549f5f",
        strip_prefix = "github.com/tdewolff/minify/v2@v2.12.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tdewolff/minify/v2/com_github_tdewolff_minify_v2-v2.12.4.zip",
            "http://ats.apps.svc/gomod/github.com/tdewolff/minify/v2/com_github_tdewolff_minify_v2-v2.12.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tdewolff/minify/v2/com_github_tdewolff_minify_v2-v2.12.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tdewolff/minify/v2/com_github_tdewolff_minify_v2-v2.12.4.zip",
        ],
    )
    go_repository(
        name = "com_github_tdewolff_parse_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tdewolff/parse/v2",
        sha256 = "5bfdded67b0164d0fbfc8c5d308a4c9c2f5ebecdcf3e769b5e9ca8586335c543",
        strip_prefix = "github.com/tdewolff/parse/v2@v2.6.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tdewolff/parse/v2/com_github_tdewolff_parse_v2-v2.6.4.zip",
            "http://ats.apps.svc/gomod/github.com/tdewolff/parse/v2/com_github_tdewolff_parse_v2-v2.6.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tdewolff/parse/v2/com_github_tdewolff_parse_v2-v2.6.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tdewolff/parse/v2/com_github_tdewolff_parse_v2-v2.6.4.zip",
        ],
    )
    go_repository(
        name = "com_github_tenntenn_modver",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tenntenn/modver",
        sha256 = "534486db97677626935f51594e1cb7c3913a646338f5bfc43175dcf4110b2672",
        strip_prefix = "github.com/tenntenn/modver@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tenntenn/modver/com_github_tenntenn_modver-v1.0.1.zip",
            "http://ats.apps.svc/gomod/github.com/tenntenn/modver/com_github_tenntenn_modver-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tenntenn/modver/com_github_tenntenn_modver-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tenntenn/modver/com_github_tenntenn_modver-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tenntenn_text_transform",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tenntenn/text/transform",
        sha256 = "41c601d6ef3c9ffa633b56069b2efb240810e0764ebbf70da1a697dde0bf8c5e",
        strip_prefix = "github.com/tenntenn/text/transform@v0.0.0-20200319021203-7eef512accb3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tenntenn/text/transform/com_github_tenntenn_text_transform-v0.0.0-20200319021203-7eef512accb3.zip",
            "http://ats.apps.svc/gomod/github.com/tenntenn/text/transform/com_github_tenntenn_text_transform-v0.0.0-20200319021203-7eef512accb3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tenntenn/text/transform/com_github_tenntenn_text_transform-v0.0.0-20200319021203-7eef512accb3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tenntenn/text/transform/com_github_tenntenn_text_transform-v0.0.0-20200319021203-7eef512accb3.zip",
        ],
    )
    go_repository(
        name = "com_github_tetafro_godot",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tetafro/godot",
        sha256 = "78d60fa2271d9327674254501091515835a45687cc02398e83d1fff7d30c15b4",
        strip_prefix = "github.com/tetafro/godot@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tetafro/godot/com_github_tetafro_godot-v1.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/tetafro/godot/com_github_tetafro_godot-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tetafro/godot/com_github_tetafro_godot-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tetafro/godot/com_github_tetafro_godot-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tiancaiamao_appdash",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tiancaiamao/appdash",
        sha256 = "a9961e6079339aec983f97fdb39d5d7258bf8d2031da68482e58e17b27a93a78",
        strip_prefix = "github.com/tiancaiamao/appdash@v0.0.0-20181126055449-889f96f722a2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tiancaiamao/appdash/com_github_tiancaiamao_appdash-v0.0.0-20181126055449-889f96f722a2.zip",
            "http://ats.apps.svc/gomod/github.com/tiancaiamao/appdash/com_github_tiancaiamao_appdash-v0.0.0-20181126055449-889f96f722a2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tiancaiamao/appdash/com_github_tiancaiamao_appdash-v0.0.0-20181126055449-889f96f722a2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tiancaiamao/appdash/com_github_tiancaiamao_appdash-v0.0.0-20181126055449-889f96f722a2.zip",
        ],
    )
    go_repository(
        name = "com_github_tiancaiamao_gp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tiancaiamao/gp",
        sha256 = "0980e2518360748b37b801c1896550b4a37a3c1fc62ebbf90631e5c67de165d3",
        strip_prefix = "github.com/tiancaiamao/gp@v0.0.0-20221230034425-4025bc8a4d4a",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tiancaiamao/gp/com_github_tiancaiamao_gp-v0.0.0-20221230034425-4025bc8a4d4a.zip",
            "http://ats.apps.svc/gomod/github.com/tiancaiamao/gp/com_github_tiancaiamao_gp-v0.0.0-20221230034425-4025bc8a4d4a.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tiancaiamao/gp/com_github_tiancaiamao_gp-v0.0.0-20221230034425-4025bc8a4d4a.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tiancaiamao/gp/com_github_tiancaiamao_gp-v0.0.0-20221230034425-4025bc8a4d4a.zip",
        ],
    )
    go_repository(
        name = "com_github_tidwall_gjson",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tidwall/gjson",
        sha256 = "e6d35da84683bc91382a31214d4c3f9a852eec040ca866a1c620a8c0d99f9676",
        strip_prefix = "github.com/tidwall/gjson@v1.14.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tidwall/gjson/com_github_tidwall_gjson-v1.14.4.zip",
            "http://ats.apps.svc/gomod/github.com/tidwall/gjson/com_github_tidwall_gjson-v1.14.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tidwall/gjson/com_github_tidwall_gjson-v1.14.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tidwall/gjson/com_github_tidwall_gjson-v1.14.4.zip",
        ],
    )
    go_repository(
        name = "com_github_tidwall_match",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tidwall/match",
        sha256 = "2ba41f7f27330d49e0e432cbf96bf90720a33e4a97be58fe53f63a7e66f04d37",
        strip_prefix = "github.com/tidwall/match@v1.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tidwall/match/com_github_tidwall_match-v1.1.1.zip",
            "http://ats.apps.svc/gomod/github.com/tidwall/match/com_github_tidwall_match-v1.1.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tidwall/match/com_github_tidwall_match-v1.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tidwall/match/com_github_tidwall_match-v1.1.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tidwall_pretty",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tidwall/pretty",
        sha256 = "9327579bf9e610de753eeb7c35c8cf1e3f56e6e5623cbf65e47bc8076023d1ab",
        strip_prefix = "github.com/tidwall/pretty@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tidwall/pretty/com_github_tidwall_pretty-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/tidwall/pretty/com_github_tidwall_pretty-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tidwall/pretty/com_github_tidwall_pretty-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tidwall/pretty/com_github_tidwall_pretty-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tidwall_sjson",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tidwall/sjson",
        sha256 = "fc40fda87c7de55362f6386e069d674772f25c9d76411ee823acb9ac78b20565",
        strip_prefix = "github.com/tidwall/sjson@v1.2.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tidwall/sjson/com_github_tidwall_sjson-v1.2.5.zip",
            "http://ats.apps.svc/gomod/github.com/tidwall/sjson/com_github_tidwall_sjson-v1.2.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tidwall/sjson/com_github_tidwall_sjson-v1.2.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tidwall/sjson/com_github_tidwall_sjson-v1.2.5.zip",
        ],
    )
    go_repository(
        name = "com_github_tikv_client_go_v2",
        build_tags = ["nextgen"],
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tikv/client-go/v2",
        sha256 = "ae7575a9055def212e39121dc880c534f5ffd6a9a50057cf36cc754419ce816a",
        strip_prefix = "github.com/tikv/client-go/v2@v2.0.8-0.20250708031306-557a4986e4c4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tikv/client-go/v2/com_github_tikv_client_go_v2-v2.0.8-0.20250708031306-557a4986e4c4.zip",
            "http://ats.apps.svc/gomod/github.com/tikv/client-go/v2/com_github_tikv_client_go_v2-v2.0.8-0.20250708031306-557a4986e4c4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tikv/client-go/v2/com_github_tikv_client_go_v2-v2.0.8-0.20250708031306-557a4986e4c4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tikv/client-go/v2/com_github_tikv_client_go_v2-v2.0.8-0.20250708031306-557a4986e4c4.zip",
        ],
    )
    go_repository(
        name = "com_github_tikv_pd_client",
        build_tags = ["nextgen"],
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tikv/pd/client",
        sha256 = "f5e502897005e01f77da34f6a687a584bf11bad405a2d6ff94e1fe0225925bd1",
        strip_prefix = "github.com/tikv/pd/client@v0.0.0-20250703091733-dfd345b89500",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tikv/pd/client/com_github_tikv_pd_client-v0.0.0-20250703091733-dfd345b89500.zip",
            "http://ats.apps.svc/gomod/github.com/tikv/pd/client/com_github_tikv_pd_client-v0.0.0-20250703091733-dfd345b89500.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tikv/pd/client/com_github_tikv_pd_client-v0.0.0-20250703091733-dfd345b89500.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tikv/pd/client/com_github_tikv_pd_client-v0.0.0-20250703091733-dfd345b89500.zip",
        ],
    )
    go_repository(
        name = "com_github_timakin_bodyclose",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/timakin/bodyclose",
        sha256 = "132f0f99b5f8aa12ee66a089a7cf52d3eaecb13e7a49a45c7f923838cac246ce",
        strip_prefix = "github.com/timakin/bodyclose@v0.0.0-20241222091800-1db5c5ca4d67",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/timakin/bodyclose/com_github_timakin_bodyclose-v0.0.0-20241222091800-1db5c5ca4d67.zip",
            "http://ats.apps.svc/gomod/github.com/timakin/bodyclose/com_github_timakin_bodyclose-v0.0.0-20241222091800-1db5c5ca4d67.zip",
            "https://cache.hawkingrei.com/gomod/github.com/timakin/bodyclose/com_github_timakin_bodyclose-v0.0.0-20241222091800-1db5c5ca4d67.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/timakin/bodyclose/com_github_timakin_bodyclose-v0.0.0-20241222091800-1db5c5ca4d67.zip",
        ],
    )
    go_repository(
        name = "com_github_timonwong_loggercheck",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/timonwong/loggercheck",
        sha256 = "466a8c1269189c7d84368b5cd1cbe5b6016d9ec347defffa14591abc0192b14e",
        strip_prefix = "github.com/timonwong/loggercheck@v0.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/timonwong/loggercheck/com_github_timonwong_loggercheck-v0.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/timonwong/loggercheck/com_github_timonwong_loggercheck-v0.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/timonwong/loggercheck/com_github_timonwong_loggercheck-v0.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/timonwong/loggercheck/com_github_timonwong_loggercheck-v0.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_tklauser_go_sysconf",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tklauser/go-sysconf",
        sha256 = "95a4a24b6f5fc5af05d94bbab39ff847a220d30c5adb4fb0a09f9c7926a2ffe8",
        strip_prefix = "github.com/tklauser/go-sysconf@v0.3.12",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tklauser/go-sysconf/com_github_tklauser_go_sysconf-v0.3.12.zip",
            "http://ats.apps.svc/gomod/github.com/tklauser/go-sysconf/com_github_tklauser_go_sysconf-v0.3.12.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tklauser/go-sysconf/com_github_tklauser_go_sysconf-v0.3.12.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tklauser/go-sysconf/com_github_tklauser_go_sysconf-v0.3.12.zip",
        ],
    )
    go_repository(
        name = "com_github_tklauser_numcpus",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tklauser/numcpus",
        sha256 = "267c7f91c5be3f1d091ee215825f91c315196f45e1fd6c4e8abb447f38549e03",
        strip_prefix = "github.com/tklauser/numcpus@v0.6.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tklauser/numcpus/com_github_tklauser_numcpus-v0.6.1.zip",
            "http://ats.apps.svc/gomod/github.com/tklauser/numcpus/com_github_tklauser_numcpus-v0.6.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tklauser/numcpus/com_github_tklauser_numcpus-v0.6.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tklauser/numcpus/com_github_tklauser_numcpus-v0.6.1.zip",
        ],
    )
    go_repository(
        name = "com_github_tmc_grpc_websocket_proxy",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tmc/grpc-websocket-proxy",
        sha256 = "7773cd68e54dc6087f6b0d1dc2e71e85f3151aa5cd9858884870954266480e24",
        strip_prefix = "github.com/tmc/grpc-websocket-proxy@v0.0.0-20220101234140-673ab2c3ae75",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tmc/grpc-websocket-proxy/com_github_tmc_grpc_websocket_proxy-v0.0.0-20220101234140-673ab2c3ae75.zip",
            "http://ats.apps.svc/gomod/github.com/tmc/grpc-websocket-proxy/com_github_tmc_grpc_websocket_proxy-v0.0.0-20220101234140-673ab2c3ae75.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tmc/grpc-websocket-proxy/com_github_tmc_grpc_websocket_proxy-v0.0.0-20220101234140-673ab2c3ae75.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tmc/grpc-websocket-proxy/com_github_tmc_grpc_websocket_proxy-v0.0.0-20220101234140-673ab2c3ae75.zip",
        ],
    )
    go_repository(
        name = "com_github_tomarrell_wrapcheck_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tomarrell/wrapcheck/v2",
        sha256 = "0a575dbc6937fdc693fcbdc67f4d6291a301e166a2b829520425e42196741c32",
        strip_prefix = "github.com/tomarrell/wrapcheck/v2@v2.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tomarrell/wrapcheck/v2/com_github_tomarrell_wrapcheck_v2-v2.11.0.zip",
            "http://ats.apps.svc/gomod/github.com/tomarrell/wrapcheck/v2/com_github_tomarrell_wrapcheck_v2-v2.11.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tomarrell/wrapcheck/v2/com_github_tomarrell_wrapcheck_v2-v2.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tomarrell/wrapcheck/v2/com_github_tomarrell_wrapcheck_v2-v2.11.0.zip",
        ],
    )
    go_repository(
        name = "com_github_tommy_muehle_go_mnd_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/tommy-muehle/go-mnd/v2",
        sha256 = "c23c7d903604381a09b9e1b1a63173bcf4c0cb179b8d0ae9975d1d0ace65172d",
        strip_prefix = "github.com/tommy-muehle/go-mnd/v2@v2.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/tommy-muehle/go-mnd/v2/com_github_tommy_muehle_go_mnd_v2-v2.5.1.zip",
            "http://ats.apps.svc/gomod/github.com/tommy-muehle/go-mnd/v2/com_github_tommy_muehle_go_mnd_v2-v2.5.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/tommy-muehle/go-mnd/v2/com_github_tommy_muehle_go_mnd_v2-v2.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/tommy-muehle/go-mnd/v2/com_github_tommy_muehle_go_mnd_v2-v2.5.1.zip",
        ],
    )
    go_repository(
        name = "com_github_twmb_murmur3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/twmb/murmur3",
        sha256 = "c51ce05e38d9e399654814fd3849eb6eca78d0a134972926fd36f53a1e182f12",
        strip_prefix = "github.com/twmb/murmur3@v1.1.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/twmb/murmur3/com_github_twmb_murmur3-v1.1.6.zip",
            "http://ats.apps.svc/gomod/github.com/twmb/murmur3/com_github_twmb_murmur3-v1.1.6.zip",
            "https://cache.hawkingrei.com/gomod/github.com/twmb/murmur3/com_github_twmb_murmur3-v1.1.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/twmb/murmur3/com_github_twmb_murmur3-v1.1.6.zip",
        ],
    )
    go_repository(
        name = "com_github_uber_jaeger_client_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/uber/jaeger-client-go",
        sha256 = "5c837b40527bd3a61b37f5c39739568b22fb72cbbad654931a567842c266a477",
        strip_prefix = "github.com/uber/jaeger-client-go@v2.22.1+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/uber/jaeger-client-go/com_github_uber_jaeger_client_go-v2.22.1+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/uber/jaeger-client-go/com_github_uber_jaeger_client_go-v2.22.1+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/uber/jaeger-client-go/com_github_uber_jaeger_client_go-v2.22.1+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/uber/jaeger-client-go/com_github_uber_jaeger_client_go-v2.22.1+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_uber_jaeger_lib",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/uber/jaeger-lib",
        sha256 = "b43fc0c89c3c54498ae6108453ca2af987e074680742dd79bdceda94685a7efb",
        strip_prefix = "github.com/uber/jaeger-lib@v2.4.1+incompatible",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/uber/jaeger-lib/com_github_uber_jaeger_lib-v2.4.1+incompatible.zip",
            "http://ats.apps.svc/gomod/github.com/uber/jaeger-lib/com_github_uber_jaeger_lib-v2.4.1+incompatible.zip",
            "https://cache.hawkingrei.com/gomod/github.com/uber/jaeger-lib/com_github_uber_jaeger_lib-v2.4.1+incompatible.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/uber/jaeger-lib/com_github_uber_jaeger_lib-v2.4.1+incompatible.zip",
        ],
    )
    go_repository(
        name = "com_github_ugorji_go_codec",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ugorji/go/codec",
        sha256 = "38616af38233e6c74ac67466a473134e346a1a864855933a5e87e6397f6b1483",
        strip_prefix = "github.com/ugorji/go/codec@v1.2.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ugorji/go/codec/com_github_ugorji_go_codec-v1.2.7.zip",
            "http://ats.apps.svc/gomod/github.com/ugorji/go/codec/com_github_ugorji_go_codec-v1.2.7.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ugorji/go/codec/com_github_ugorji_go_codec-v1.2.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ugorji/go/codec/com_github_ugorji_go_codec-v1.2.7.zip",
        ],
    )
    go_repository(
        name = "com_github_ultraware_funlen",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ultraware/funlen",
        sha256 = "b43d298899834e4a7c33b6245b4a41d86dd7fb0d064872ff95e4d10a48ff9dbb",
        strip_prefix = "github.com/ultraware/funlen@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ultraware/funlen/com_github_ultraware_funlen-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/ultraware/funlen/com_github_ultraware_funlen-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ultraware/funlen/com_github_ultraware_funlen-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ultraware/funlen/com_github_ultraware_funlen-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ultraware_whitespace",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ultraware/whitespace",
        sha256 = "9ad5c4db6d72de040276dba3779980a774633730d299639e13b61548819d41eb",
        strip_prefix = "github.com/ultraware/whitespace@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ultraware/whitespace/com_github_ultraware_whitespace-v0.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/ultraware/whitespace/com_github_ultraware_whitespace-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ultraware/whitespace/com_github_ultraware_whitespace-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ultraware/whitespace/com_github_ultraware_whitespace-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_urfave_negroni",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/urfave/negroni",
        sha256 = "7b50615961d34d748866565b8885edd7013e33812acdbaed47502d7cc73a4bbd",
        strip_prefix = "github.com/urfave/negroni@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/urfave/negroni/com_github_urfave_negroni-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/urfave/negroni/com_github_urfave_negroni-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/urfave/negroni/com_github_urfave_negroni-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/urfave/negroni/com_github_urfave_negroni-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_uudashr_gocognit",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/uudashr/gocognit",
        sha256 = "4476bfcb8dd7d08a0308b57446be741858986614567c7387457ff37f04fa157f",
        strip_prefix = "github.com/uudashr/gocognit@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/uudashr/gocognit/com_github_uudashr_gocognit-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/uudashr/gocognit/com_github_uudashr_gocognit-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/uudashr/gocognit/com_github_uudashr_gocognit-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/uudashr/gocognit/com_github_uudashr_gocognit-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_uudashr_iface",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/uudashr/iface",
        sha256 = "9cc23a514a05f9864beebd5b8883ceb46cc1d247b4e11d2644488c489cca5f64",
        strip_prefix = "github.com/uudashr/iface@v1.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/uudashr/iface/com_github_uudashr_iface-v1.4.1.zip",
            "http://ats.apps.svc/gomod/github.com/uudashr/iface/com_github_uudashr_iface-v1.4.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/uudashr/iface/com_github_uudashr_iface-v1.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/uudashr/iface/com_github_uudashr_iface-v1.4.1.zip",
        ],
    )
    go_repository(
        name = "com_github_valyala_bytebufferpool",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/valyala/bytebufferpool",
        sha256 = "7f59f32c568539afee9a21a665a4156962b019beaac8404e26ba37af056b4f1e",
        strip_prefix = "github.com/valyala/bytebufferpool@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/valyala/bytebufferpool/com_github_valyala_bytebufferpool-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/valyala/bytebufferpool/com_github_valyala_bytebufferpool-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/valyala/bytebufferpool/com_github_valyala_bytebufferpool-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/valyala/bytebufferpool/com_github_valyala_bytebufferpool-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_valyala_fasthttp",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/valyala/fasthttp",
        sha256 = "7dc064a5ae5d64cf058c5b9d53b1d39a6e27a3d3bc24fe7cba47d07212f76fbc",
        strip_prefix = "github.com/valyala/fasthttp@v1.40.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/valyala/fasthttp/com_github_valyala_fasthttp-v1.40.0.zip",
            "http://ats.apps.svc/gomod/github.com/valyala/fasthttp/com_github_valyala_fasthttp-v1.40.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/valyala/fasthttp/com_github_valyala_fasthttp-v1.40.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/valyala/fasthttp/com_github_valyala_fasthttp-v1.40.0.zip",
        ],
    )
    go_repository(
        name = "com_github_valyala_fasttemplate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/valyala/fasttemplate",
        sha256 = "86f15c8e9fa85757afe7a865402f1fd6208e85bde797cd934b3a2cf64b5a9f4d",
        strip_prefix = "github.com/valyala/fasttemplate@v1.2.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/valyala/fasttemplate/com_github_valyala_fasttemplate-v1.2.2.zip",
            "http://ats.apps.svc/gomod/github.com/valyala/fasttemplate/com_github_valyala_fasttemplate-v1.2.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/valyala/fasttemplate/com_github_valyala_fasttemplate-v1.2.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/valyala/fasttemplate/com_github_valyala_fasttemplate-v1.2.2.zip",
        ],
    )
    go_repository(
        name = "com_github_valyala_quicktemplate",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/valyala/quicktemplate",
        sha256 = "173a41cc747e909777478e88d77a3e2db0cb1e85c274571a737d22a74602d716",
        strip_prefix = "github.com/valyala/quicktemplate@v1.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/valyala/quicktemplate/com_github_valyala_quicktemplate-v1.8.0.zip",
            "http://ats.apps.svc/gomod/github.com/valyala/quicktemplate/com_github_valyala_quicktemplate-v1.8.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/valyala/quicktemplate/com_github_valyala_quicktemplate-v1.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/valyala/quicktemplate/com_github_valyala_quicktemplate-v1.8.0.zip",
        ],
    )
    go_repository(
        name = "com_github_vbauerster_mpb_v7",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/vbauerster/mpb/v7",
        sha256 = "1b2efa91de6840a3d628fa2c3d48d3762d411e1a47a71b2e388b49ed2264cd38",
        strip_prefix = "github.com/vbauerster/mpb/v7@v7.5.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/vbauerster/mpb/v7/com_github_vbauerster_mpb_v7-v7.5.3.zip",
            "http://ats.apps.svc/gomod/github.com/vbauerster/mpb/v7/com_github_vbauerster_mpb_v7-v7.5.3.zip",
            "https://cache.hawkingrei.com/gomod/github.com/vbauerster/mpb/v7/com_github_vbauerster_mpb_v7-v7.5.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/vbauerster/mpb/v7/com_github_vbauerster_mpb_v7-v7.5.3.zip",
        ],
    )
    go_repository(
        name = "com_github_vividcortex_ewma",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/VividCortex/ewma",
        sha256 = "facfeeec2dac447211e733ed6f190e9068a8a89d770ea40b1d6955fa6cff36cf",
        strip_prefix = "github.com/VividCortex/ewma@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/VividCortex/ewma/com_github_vividcortex_ewma-v1.2.0.zip",
            "http://ats.apps.svc/gomod/github.com/VividCortex/ewma/com_github_vividcortex_ewma-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/VividCortex/ewma/com_github_vividcortex_ewma-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/VividCortex/ewma/com_github_vividcortex_ewma-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_github_vmihailenco_msgpack_v5",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/vmihailenco/msgpack/v5",
        sha256 = "3437e7dc0e9a55985c6a68b4a331e685f1125aeb98a0cec0585145b8353a66ae",
        strip_prefix = "github.com/vmihailenco/msgpack/v5@v5.3.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/vmihailenco/msgpack/v5/com_github_vmihailenco_msgpack_v5-v5.3.5.zip",
            "http://ats.apps.svc/gomod/github.com/vmihailenco/msgpack/v5/com_github_vmihailenco_msgpack_v5-v5.3.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/vmihailenco/msgpack/v5/com_github_vmihailenco_msgpack_v5-v5.3.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/vmihailenco/msgpack/v5/com_github_vmihailenco_msgpack_v5-v5.3.5.zip",
        ],
    )
    go_repository(
        name = "com_github_vmihailenco_tagparser_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/vmihailenco/tagparser/v2",
        sha256 = "70096ead331b4ac4efc0bf740674cbe55772beee6eace39507a610c5652aa8b5",
        strip_prefix = "github.com/vmihailenco/tagparser/v2@v2.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/vmihailenco/tagparser/v2/com_github_vmihailenco_tagparser_v2-v2.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/vmihailenco/tagparser/v2/com_github_vmihailenco_tagparser_v2-v2.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/vmihailenco/tagparser/v2/com_github_vmihailenco_tagparser_v2-v2.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/vmihailenco/tagparser/v2/com_github_vmihailenco_tagparser_v2-v2.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_vultr_govultr_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/vultr/govultr/v2",
        sha256 = "3c8f94575d509164614b364a75529b1dab895c228a5b5516b7b6334c96e5094a",
        strip_prefix = "github.com/vultr/govultr/v2@v2.17.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/vultr/govultr/v2/com_github_vultr_govultr_v2-v2.17.2.zip",
            "http://ats.apps.svc/gomod/github.com/vultr/govultr/v2/com_github_vultr_govultr_v2-v2.17.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/vultr/govultr/v2/com_github_vultr_govultr_v2-v2.17.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/vultr/govultr/v2/com_github_vultr_govultr_v2-v2.17.2.zip",
        ],
    )
    go_repository(
        name = "com_github_wangjohn_quickselect",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/wangjohn/quickselect",
        sha256 = "90a1aa0080655f76952ef9362e3661c0d56899061a540a6504aedd50306e79f0",
        strip_prefix = "github.com/wangjohn/quickselect@v0.0.0-20161129230411-ed8402a42d5f",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/wangjohn/quickselect/com_github_wangjohn_quickselect-v0.0.0-20161129230411-ed8402a42d5f.zip",
            "http://ats.apps.svc/gomod/github.com/wangjohn/quickselect/com_github_wangjohn_quickselect-v0.0.0-20161129230411-ed8402a42d5f.zip",
            "https://cache.hawkingrei.com/gomod/github.com/wangjohn/quickselect/com_github_wangjohn_quickselect-v0.0.0-20161129230411-ed8402a42d5f.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/wangjohn/quickselect/com_github_wangjohn_quickselect-v0.0.0-20161129230411-ed8402a42d5f.zip",
        ],
    )
    go_repository(
        name = "com_github_xen0n_gosmopolitan",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xen0n/gosmopolitan",
        sha256 = "1b8540cd9493549a31fec8b0d6b36e02f52e5908f447765bc7a1878c07c9cb9a",
        strip_prefix = "github.com/xen0n/gosmopolitan@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xen0n/gosmopolitan/com_github_xen0n_gosmopolitan-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/xen0n/gosmopolitan/com_github_xen0n_gosmopolitan-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xen0n/gosmopolitan/com_github_xen0n_gosmopolitan-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xen0n/gosmopolitan/com_github_xen0n_gosmopolitan-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_xhit_go_str2duration_v2",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xhit/go-str2duration/v2",
        sha256 = "907db1bdf362568191e659f82339c21a4031d433bc5ac52f36de23eeceb8cb26",
        strip_prefix = "github.com/xhit/go-str2duration/v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xhit/go-str2duration/v2/com_github_xhit_go_str2duration_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/github.com/xhit/go-str2duration/v2/com_github_xhit_go_str2duration_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xhit/go-str2duration/v2/com_github_xhit_go_str2duration_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xhit/go-str2duration/v2/com_github_xhit_go_str2duration_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "com_github_xiang90_probing",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xiang90/probing",
        sha256 = "ee5b87f49c72ea40bddc94ed228874ba9fcd3a3745ad613011131147c773b3ff",
        strip_prefix = "github.com/xiang90/probing@v0.0.0-20221125231312-a49e3df8f510",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xiang90/probing/com_github_xiang90_probing-v0.0.0-20221125231312-a49e3df8f510.zip",
            "http://ats.apps.svc/gomod/github.com/xiang90/probing/com_github_xiang90_probing-v0.0.0-20221125231312-a49e3df8f510.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xiang90/probing/com_github_xiang90_probing-v0.0.0-20221125231312-a49e3df8f510.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xiang90/probing/com_github_xiang90_probing-v0.0.0-20221125231312-a49e3df8f510.zip",
        ],
    )
    go_repository(
        name = "com_github_xitongsys_parquet_go",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xitongsys/parquet-go",
        sha256 = "5b9473cce95cf094d398348fd394002b656ae1363bb5c33c1338fcdcd57e1b33",
        strip_prefix = "github.com/xitongsys/parquet-go@v1.6.3-0.20240520233950-75e935fc3e17",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xitongsys/parquet-go/com_github_xitongsys_parquet_go-v1.6.3-0.20240520233950-75e935fc3e17.zip",
            "http://ats.apps.svc/gomod/github.com/xitongsys/parquet-go/com_github_xitongsys_parquet_go-v1.6.3-0.20240520233950-75e935fc3e17.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xitongsys/parquet-go/com_github_xitongsys_parquet_go-v1.6.3-0.20240520233950-75e935fc3e17.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xitongsys/parquet-go/com_github_xitongsys_parquet_go-v1.6.3-0.20240520233950-75e935fc3e17.zip",
        ],
    )
    go_repository(
        name = "com_github_xitongsys_parquet_go_source",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xitongsys/parquet-go-source",
        sha256 = "9fa786105465c7da0b4d0a3f334b5d284cce486229a0631e5bd962e4dc67cd50",
        strip_prefix = "github.com/xitongsys/parquet-go-source@v0.0.0-20200817004010-026bad9b25d0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xitongsys/parquet-go-source/com_github_xitongsys_parquet_go_source-v0.0.0-20200817004010-026bad9b25d0.zip",
            "http://ats.apps.svc/gomod/github.com/xitongsys/parquet-go-source/com_github_xitongsys_parquet_go_source-v0.0.0-20200817004010-026bad9b25d0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xitongsys/parquet-go-source/com_github_xitongsys_parquet_go_source-v0.0.0-20200817004010-026bad9b25d0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xitongsys/parquet-go-source/com_github_xitongsys_parquet_go_source-v0.0.0-20200817004010-026bad9b25d0.zip",
        ],
    )
    go_repository(
        name = "com_github_xo_terminfo",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xo/terminfo",
        sha256 = "b8f4270191e08e135e932dfe168769046a4268ec7f3892593b1d773b2c5fa4cf",
        strip_prefix = "github.com/xo/terminfo@v0.0.0-20220910002029-abceb7e1c41e",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xo/terminfo/com_github_xo_terminfo-v0.0.0-20220910002029-abceb7e1c41e.zip",
            "http://ats.apps.svc/gomod/github.com/xo/terminfo/com_github_xo_terminfo-v0.0.0-20220910002029-abceb7e1c41e.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xo/terminfo/com_github_xo_terminfo-v0.0.0-20220910002029-abceb7e1c41e.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xo/terminfo/com_github_xo_terminfo-v0.0.0-20220910002029-abceb7e1c41e.zip",
        ],
    )
    go_repository(
        name = "com_github_xordataexchange_crypt",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/xordataexchange/crypt",
        sha256 = "46dc29ef77d77a2bc3e7bd70c94dbaeec0062dd3bd6fcacbaab785c15dcd625b",
        strip_prefix = "github.com/xordataexchange/crypt@v0.0.3-0.20170626215501-b2862e3d0a77",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/xordataexchange/crypt/com_github_xordataexchange_crypt-v0.0.3-0.20170626215501-b2862e3d0a77.zip",
            "http://ats.apps.svc/gomod/github.com/xordataexchange/crypt/com_github_xordataexchange_crypt-v0.0.3-0.20170626215501-b2862e3d0a77.zip",
            "https://cache.hawkingrei.com/gomod/github.com/xordataexchange/crypt/com_github_xordataexchange_crypt-v0.0.3-0.20170626215501-b2862e3d0a77.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/xordataexchange/crypt/com_github_xordataexchange_crypt-v0.0.3-0.20170626215501-b2862e3d0a77.zip",
        ],
    )
    go_repository(
        name = "com_github_yagipy_maintidx",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yagipy/maintidx",
        sha256 = "a2b1f6b7c18ec97172872f416c18d20ad5e843c3b91c802290a27354113a653a",
        strip_prefix = "github.com/yagipy/maintidx@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/yagipy/maintidx/com_github_yagipy_maintidx-v1.0.0.zip",
            "http://ats.apps.svc/gomod/github.com/yagipy/maintidx/com_github_yagipy_maintidx-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/yagipy/maintidx/com_github_yagipy_maintidx-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/yagipy/maintidx/com_github_yagipy_maintidx-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "com_github_yangkeao_go_mysql_driver",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/YangKeao/go-mysql-driver",
        sha256 = "66ba9bed8b68899ea4adc729fbaf160bd634fe1afa51621a3dc5b153b538eb57",
        strip_prefix = "github.com/YangKeao/go-mysql-driver@v0.0.0-20240627104025-dd5589458cfa",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/YangKeao/go-mysql-driver/com_github_yangkeao_go_mysql_driver-v0.0.0-20240627104025-dd5589458cfa.zip",
            "http://ats.apps.svc/gomod/github.com/YangKeao/go-mysql-driver/com_github_yangkeao_go_mysql_driver-v0.0.0-20240627104025-dd5589458cfa.zip",
            "https://cache.hawkingrei.com/gomod/github.com/YangKeao/go-mysql-driver/com_github_yangkeao_go_mysql_driver-v0.0.0-20240627104025-dd5589458cfa.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/YangKeao/go-mysql-driver/com_github_yangkeao_go_mysql_driver-v0.0.0-20240627104025-dd5589458cfa.zip",
        ],
    )
    go_repository(
        name = "com_github_yeya24_promlinter",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yeya24/promlinter",
        sha256 = "1e93a590632c1c0cd43b37c48754084b013656d6597f420c01786deeca91c275",
        strip_prefix = "github.com/yeya24/promlinter@v0.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/yeya24/promlinter/com_github_yeya24_promlinter-v0.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/yeya24/promlinter/com_github_yeya24_promlinter-v0.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/yeya24/promlinter/com_github_yeya24_promlinter-v0.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/yeya24/promlinter/com_github_yeya24_promlinter-v0.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_ykadowak_zerologlint",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/ykadowak/zerologlint",
        sha256 = "33e308a504d15d2e5b8bb8345ed0d4783c3a921e918691bda5c308fd3a744bcf",
        strip_prefix = "github.com/ykadowak/zerologlint@v0.1.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/ykadowak/zerologlint/com_github_ykadowak_zerologlint-v0.1.5.zip",
            "http://ats.apps.svc/gomod/github.com/ykadowak/zerologlint/com_github_ykadowak_zerologlint-v0.1.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/ykadowak/zerologlint/com_github_ykadowak_zerologlint-v0.1.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/ykadowak/zerologlint/com_github_ykadowak_zerologlint-v0.1.5.zip",
        ],
    )
    go_repository(
        name = "com_github_yosssi_ace",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yosssi/ace",
        sha256 = "96157dbef72f2f69a900e09b3e58093ee24f7df341ac287bddfb15f8c3f530db",
        strip_prefix = "github.com/yosssi/ace@v0.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/yosssi/ace/com_github_yosssi_ace-v0.0.5.zip",
            "http://ats.apps.svc/gomod/github.com/yosssi/ace/com_github_yosssi_ace-v0.0.5.zip",
            "https://cache.hawkingrei.com/gomod/github.com/yosssi/ace/com_github_yosssi_ace-v0.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/yosssi/ace/com_github_yosssi_ace-v0.0.5.zip",
        ],
    )
    go_repository(
        name = "com_github_yuin_goldmark",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yuin/goldmark",
        sha256 = "bb41a602b174345fda392c8ad83fcc93217c285c763699677630be90feb7a5e3",
        strip_prefix = "github.com/yuin/goldmark@v1.4.13",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/yuin/goldmark/com_github_yuin_goldmark-v1.4.13.zip",
            "http://ats.apps.svc/gomod/github.com/yuin/goldmark/com_github_yuin_goldmark-v1.4.13.zip",
            "https://cache.hawkingrei.com/gomod/github.com/yuin/goldmark/com_github_yuin_goldmark-v1.4.13.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/yuin/goldmark/com_github_yuin_goldmark-v1.4.13.zip",
        ],
    )
    go_repository(
        name = "com_github_yusufpapurcu_wmi",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/yusufpapurcu/wmi",
        sha256 = "c2a0a12203162ef8fd6f65e191aac359823d370e113122cbd8e80711ddc9c1f9",
        strip_prefix = "github.com/yusufpapurcu/wmi@v1.2.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/yusufpapurcu/wmi/com_github_yusufpapurcu_wmi-v1.2.4.zip",
            "http://ats.apps.svc/gomod/github.com/yusufpapurcu/wmi/com_github_yusufpapurcu_wmi-v1.2.4.zip",
            "https://cache.hawkingrei.com/gomod/github.com/yusufpapurcu/wmi/com_github_yusufpapurcu_wmi-v1.2.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/yusufpapurcu/wmi/com_github_yusufpapurcu_wmi-v1.2.4.zip",
        ],
    )
    go_repository(
        name = "com_github_zeebo_assert",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/zeebo/assert",
        sha256 = "1f01421d74ff37cb8247988155be9e6877d336029bcd887a1d035fd32d7ab6ae",
        strip_prefix = "github.com/zeebo/assert@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/zeebo/assert/com_github_zeebo_assert-v1.3.0.zip",
            "http://ats.apps.svc/gomod/github.com/zeebo/assert/com_github_zeebo_assert-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/zeebo/assert/com_github_zeebo_assert-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/zeebo/assert/com_github_zeebo_assert-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "com_github_zeebo_xxh3",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/zeebo/xxh3",
        sha256 = "190e5ef1f672e9321a1580bdd31c6440fde6044ca8168d2b489cf50cdc4f58a6",
        strip_prefix = "github.com/zeebo/xxh3@v1.0.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/zeebo/xxh3/com_github_zeebo_xxh3-v1.0.2.zip",
            "http://ats.apps.svc/gomod/github.com/zeebo/xxh3/com_github_zeebo_xxh3-v1.0.2.zip",
            "https://cache.hawkingrei.com/gomod/github.com/zeebo/xxh3/com_github_zeebo_xxh3-v1.0.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/zeebo/xxh3/com_github_zeebo_xxh3-v1.0.2.zip",
        ],
    )
    go_repository(
        name = "com_github_zyedidia_generic",
        build_file_proto_mode = "disable_global",
        importpath = "github.com/zyedidia/generic",
        sha256 = "21f980420a46e0f6ed564dd9658ddab9991cef8eca32804a956fb65f7f9d4c31",
        strip_prefix = "github.com/zyedidia/generic@v1.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/zyedidia/generic/com_github_zyedidia_generic-v1.2.1.zip",
            "http://ats.apps.svc/gomod/github.com/zyedidia/generic/com_github_zyedidia_generic-v1.2.1.zip",
            "https://cache.hawkingrei.com/gomod/github.com/zyedidia/generic/com_github_zyedidia_generic-v1.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/zyedidia/generic/com_github_zyedidia_generic-v1.2.1.zip",
        ],
    )
    go_repository(
        name = "com_gitlab_bosi_decorder",
        build_file_proto_mode = "disable_global",
        importpath = "gitlab.com/bosi/decorder",
        sha256 = "0f7e812510baa3144be12fca66ee6551cc72177fe53d5ca68dfe10cfa3085cd1",
        strip_prefix = "gitlab.com/bosi/decorder@v0.4.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gitlab.com/bosi/decorder/com_gitlab_bosi_decorder-v0.4.2.zip",
            "http://ats.apps.svc/gomod/gitlab.com/bosi/decorder/com_gitlab_bosi_decorder-v0.4.2.zip",
            "https://cache.hawkingrei.com/gomod/gitlab.com/bosi/decorder/com_gitlab_bosi_decorder-v0.4.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gitlab.com/bosi/decorder/com_gitlab_bosi_decorder-v0.4.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go",
        sha256 = "ef93c9d2381d8d65511876281f760589a199afa5765c2b3efdfce246f745e2ec",
        strip_prefix = "cloud.google.com/go@v0.112.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/com_google_cloud_go-v0.112.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/com_google_cloud_go-v0.112.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/com_google_cloud_go-v0.112.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/com_google_cloud_go-v0.112.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_accessapproval",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/accessapproval",
        sha256 = "a7c5416a866079d36da0d874a7fe56887bf8ce8cce3174fa4a793f08965c0eea",
        strip_prefix = "cloud.google.com/go/accessapproval@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/accessapproval/com_google_cloud_go_accessapproval-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/accessapproval/com_google_cloud_go_accessapproval-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/accessapproval/com_google_cloud_go_accessapproval-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/accessapproval/com_google_cloud_go_accessapproval-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_accesscontextmanager",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/accesscontextmanager",
        sha256 = "e70510f80a160d30dc7c8a0fde207dcf5cae513e38dc566903323ef42595e5ba",
        strip_prefix = "cloud.google.com/go/accesscontextmanager@v1.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/accesscontextmanager/com_google_cloud_go_accesscontextmanager-v1.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/accesscontextmanager/com_google_cloud_go_accesscontextmanager-v1.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/accesscontextmanager/com_google_cloud_go_accesscontextmanager-v1.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/accesscontextmanager/com_google_cloud_go_accesscontextmanager-v1.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_aiplatform",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/aiplatform",
        sha256 = "4ae41774aeffd2202ed00cdcdf60487cfa114e384ecfbf1cb3862d4322ad4ac3",
        strip_prefix = "cloud.google.com/go/aiplatform@v1.66.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/aiplatform/com_google_cloud_go_aiplatform-v1.66.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/aiplatform/com_google_cloud_go_aiplatform-v1.66.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/aiplatform/com_google_cloud_go_aiplatform-v1.66.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/aiplatform/com_google_cloud_go_aiplatform-v1.66.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_analytics",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/analytics",
        sha256 = "25f6ff05e654184ff8b3998a940e52ddfe558ccc6768a06f2b5dd38cff19f7ac",
        strip_prefix = "cloud.google.com/go/analytics@v0.23.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/analytics/com_google_cloud_go_analytics-v0.23.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/analytics/com_google_cloud_go_analytics-v0.23.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/analytics/com_google_cloud_go_analytics-v0.23.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/analytics/com_google_cloud_go_analytics-v0.23.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_apigateway",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/apigateway",
        sha256 = "88cd110ac5d02e8f8dc27655decbd98b3a739506a2d52978b7d2ec8572c98027",
        strip_prefix = "cloud.google.com/go/apigateway@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/apigateway/com_google_cloud_go_apigateway-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/apigateway/com_google_cloud_go_apigateway-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/apigateway/com_google_cloud_go_apigateway-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/apigateway/com_google_cloud_go_apigateway-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_apigeeconnect",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/apigeeconnect",
        sha256 = "ccc3dfcc5d27545538950de439bd6d21fc3402c84397f3cf30042c86116c5491",
        strip_prefix = "cloud.google.com/go/apigeeconnect@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/apigeeconnect/com_google_cloud_go_apigeeconnect-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/apigeeconnect/com_google_cloud_go_apigeeconnect-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/apigeeconnect/com_google_cloud_go_apigeeconnect-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/apigeeconnect/com_google_cloud_go_apigeeconnect-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_apigeeregistry",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/apigeeregistry",
        sha256 = "e776dbe59cc5095781c5cdc350d2759c56a35bfd73e150986c4e95695b92f005",
        strip_prefix = "cloud.google.com/go/apigeeregistry@v0.8.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/apigeeregistry/com_google_cloud_go_apigeeregistry-v0.8.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/apigeeregistry/com_google_cloud_go_apigeeregistry-v0.8.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/apigeeregistry/com_google_cloud_go_apigeeregistry-v0.8.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/apigeeregistry/com_google_cloud_go_apigeeregistry-v0.8.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_appengine",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/appengine",
        sha256 = "c03275f83ee6e05413dadd5999dd88ef07c212155caae469e9a5ca0733a7a6c5",
        strip_prefix = "cloud.google.com/go/appengine@v1.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/appengine/com_google_cloud_go_appengine-v1.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/appengine/com_google_cloud_go_appengine-v1.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/appengine/com_google_cloud_go_appengine-v1.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/appengine/com_google_cloud_go_appengine-v1.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_area120",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/area120",
        sha256 = "737542aefc2517293817f0013577fa88c2cd65a3a8517a6ad57d182f997ad10c",
        strip_prefix = "cloud.google.com/go/area120@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/area120/com_google_cloud_go_area120-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/area120/com_google_cloud_go_area120-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/area120/com_google_cloud_go_area120-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/area120/com_google_cloud_go_area120-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_artifactregistry",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/artifactregistry",
        sha256 = "995b7bd1f5c12daa2d732f8ceaa8f7fc514e91a4f83370a00d91eee131b5de0d",
        strip_prefix = "cloud.google.com/go/artifactregistry@v1.14.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/artifactregistry/com_google_cloud_go_artifactregistry-v1.14.8.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/artifactregistry/com_google_cloud_go_artifactregistry-v1.14.8.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/artifactregistry/com_google_cloud_go_artifactregistry-v1.14.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/artifactregistry/com_google_cloud_go_artifactregistry-v1.14.8.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_asset",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/asset",
        sha256 = "560d980dfc50e56ab5573e53e26dca22104864a2d26f555f2b475045d7e97548",
        strip_prefix = "cloud.google.com/go/asset@v1.18.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/asset/com_google_cloud_go_asset-v1.18.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/asset/com_google_cloud_go_asset-v1.18.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/asset/com_google_cloud_go_asset-v1.18.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/asset/com_google_cloud_go_asset-v1.18.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_assuredworkloads",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/assuredworkloads",
        sha256 = "1f39a845f67df1406b80cf4e94ebc4ac0d3d40e2d82cf8f8357b2934c49b3973",
        strip_prefix = "cloud.google.com/go/assuredworkloads@v1.11.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/assuredworkloads/com_google_cloud_go_assuredworkloads-v1.11.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/assuredworkloads/com_google_cloud_go_assuredworkloads-v1.11.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/assuredworkloads/com_google_cloud_go_assuredworkloads-v1.11.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/assuredworkloads/com_google_cloud_go_assuredworkloads-v1.11.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_automl",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/automl",
        sha256 = "7d1c2d2ae85197feedb0cd90383deeb1cd8cf5595e7e1bdce43959509019c184",
        strip_prefix = "cloud.google.com/go/automl@v1.13.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/automl/com_google_cloud_go_automl-v1.13.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/automl/com_google_cloud_go_automl-v1.13.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/automl/com_google_cloud_go_automl-v1.13.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/automl/com_google_cloud_go_automl-v1.13.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_baremetalsolution",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/baremetalsolution",
        sha256 = "cbdf6a0e464b07715b46efcf9f5cda743b84c54a72b184e88431a002dca7bda6",
        strip_prefix = "cloud.google.com/go/baremetalsolution@v1.2.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/baremetalsolution/com_google_cloud_go_baremetalsolution-v1.2.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/baremetalsolution/com_google_cloud_go_baremetalsolution-v1.2.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/baremetalsolution/com_google_cloud_go_baremetalsolution-v1.2.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/baremetalsolution/com_google_cloud_go_baremetalsolution-v1.2.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_batch",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/batch",
        sha256 = "9a42e598e819035d6f224ef49e10746e321b46483e65dc7e6854f04a7732db39",
        strip_prefix = "cloud.google.com/go/batch@v1.8.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/batch/com_google_cloud_go_batch-v1.8.3.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/batch/com_google_cloud_go_batch-v1.8.3.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/batch/com_google_cloud_go_batch-v1.8.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/batch/com_google_cloud_go_batch-v1.8.3.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_beyondcorp",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/beyondcorp",
        sha256 = "b83b9923fc27f9cfdb6a45763de0b61a3f8d45cacfbd5a3e97d3fa4d8971a77b",
        strip_prefix = "cloud.google.com/go/beyondcorp@v1.0.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/beyondcorp/com_google_cloud_go_beyondcorp-v1.0.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/beyondcorp/com_google_cloud_go_beyondcorp-v1.0.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/beyondcorp/com_google_cloud_go_beyondcorp-v1.0.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/beyondcorp/com_google_cloud_go_beyondcorp-v1.0.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_bigquery",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/bigquery",
        sha256 = "5076c760a2b1511f427430d82b5c1348d2d8a13a52558216e2f98e4022458eb6",
        strip_prefix = "cloud.google.com/go/bigquery@v1.60.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/bigquery/com_google_cloud_go_bigquery-v1.60.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/bigquery/com_google_cloud_go_bigquery-v1.60.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/bigquery/com_google_cloud_go_bigquery-v1.60.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/bigquery/com_google_cloud_go_bigquery-v1.60.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_billing",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/billing",
        sha256 = "980e3188c97135353bc5c721f45a77ed5c8c37418bfa8529b715c0b75512b70c",
        strip_prefix = "cloud.google.com/go/billing@v1.18.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/billing/com_google_cloud_go_billing-v1.18.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/billing/com_google_cloud_go_billing-v1.18.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/billing/com_google_cloud_go_billing-v1.18.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/billing/com_google_cloud_go_billing-v1.18.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_binaryauthorization",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/binaryauthorization",
        sha256 = "ab6f09d297809da5305723b9602408db406b9473da9f7a658c5d8d1a9b5affac",
        strip_prefix = "cloud.google.com/go/binaryauthorization@v1.8.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/binaryauthorization/com_google_cloud_go_binaryauthorization-v1.8.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/binaryauthorization/com_google_cloud_go_binaryauthorization-v1.8.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/binaryauthorization/com_google_cloud_go_binaryauthorization-v1.8.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/binaryauthorization/com_google_cloud_go_binaryauthorization-v1.8.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_certificatemanager",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/certificatemanager",
        sha256 = "dc8ff8b5eee7cb261023e109dff4177d8aae4a1e6b6c9346b66cc008db26f976",
        strip_prefix = "cloud.google.com/go/certificatemanager@v1.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/certificatemanager/com_google_cloud_go_certificatemanager-v1.8.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/certificatemanager/com_google_cloud_go_certificatemanager-v1.8.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/certificatemanager/com_google_cloud_go_certificatemanager-v1.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/certificatemanager/com_google_cloud_go_certificatemanager-v1.8.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_channel",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/channel",
        sha256 = "00b5b8c159da49d6e33981dd6577464a317ca708d2df7ff5265c95de41d94c88",
        strip_prefix = "cloud.google.com/go/channel@v1.17.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/channel/com_google_cloud_go_channel-v1.17.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/channel/com_google_cloud_go_channel-v1.17.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/channel/com_google_cloud_go_channel-v1.17.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/channel/com_google_cloud_go_channel-v1.17.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_cloudbuild",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/cloudbuild",
        sha256 = "5c53087fc6dd304c34043ccfb0ab958d89fedd6c27b844148884fa8b17a6ab8d",
        strip_prefix = "cloud.google.com/go/cloudbuild@v1.16.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/cloudbuild/com_google_cloud_go_cloudbuild-v1.16.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/cloudbuild/com_google_cloud_go_cloudbuild-v1.16.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/cloudbuild/com_google_cloud_go_cloudbuild-v1.16.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/cloudbuild/com_google_cloud_go_cloudbuild-v1.16.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_clouddms",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/clouddms",
        sha256 = "59c0d659e1094b0d9137becd3335b8ddd9c5a1e684751a0d9013a2071878c0d1",
        strip_prefix = "cloud.google.com/go/clouddms@v1.7.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/clouddms/com_google_cloud_go_clouddms-v1.7.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/clouddms/com_google_cloud_go_clouddms-v1.7.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/clouddms/com_google_cloud_go_clouddms-v1.7.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/clouddms/com_google_cloud_go_clouddms-v1.7.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_cloudtasks",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/cloudtasks",
        sha256 = "96627633de03d5ca30e4788b98097c51f93e5b4139ec0b9605d508ea7d4ab885",
        strip_prefix = "cloud.google.com/go/cloudtasks@v1.12.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/cloudtasks/com_google_cloud_go_cloudtasks-v1.12.7.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/cloudtasks/com_google_cloud_go_cloudtasks-v1.12.7.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/cloudtasks/com_google_cloud_go_cloudtasks-v1.12.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/cloudtasks/com_google_cloud_go_cloudtasks-v1.12.7.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_compute",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/compute",
        sha256 = "5173a017a15f7874e68752a8116556fe0d7e5e11344dd4265c454467bb651cb8",
        strip_prefix = "cloud.google.com/go/compute@v1.25.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/compute/com_google_cloud_go_compute-v1.25.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/compute/com_google_cloud_go_compute-v1.25.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/compute/com_google_cloud_go_compute-v1.25.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/compute/com_google_cloud_go_compute-v1.25.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_compute_metadata",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/compute/metadata",
        sha256 = "c0ab79c30870c1aa9912fb0fdcb043e0044782825988e40f59401d227976b677",
        strip_prefix = "cloud.google.com/go/compute/metadata@v0.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/compute/metadata/com_google_cloud_go_compute_metadata-v0.3.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/compute/metadata/com_google_cloud_go_compute_metadata-v0.3.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/compute/metadata/com_google_cloud_go_compute_metadata-v0.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/compute/metadata/com_google_cloud_go_compute_metadata-v0.3.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_contactcenterinsights",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/contactcenterinsights",
        sha256 = "08bb41cddc825d506c308de2e626b9064f93717ba5d46f0e96704276e6137bd2",
        strip_prefix = "cloud.google.com/go/contactcenterinsights@v1.13.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/contactcenterinsights/com_google_cloud_go_contactcenterinsights-v1.13.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/contactcenterinsights/com_google_cloud_go_contactcenterinsights-v1.13.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/contactcenterinsights/com_google_cloud_go_contactcenterinsights-v1.13.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/contactcenterinsights/com_google_cloud_go_contactcenterinsights-v1.13.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_container",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/container",
        sha256 = "9dcc75ba98b0933b060f7b9cda65be293f9ab56f70c6c9e3d863c1ff5133ad36",
        strip_prefix = "cloud.google.com/go/container@v1.35.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/container/com_google_cloud_go_container-v1.35.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/container/com_google_cloud_go_container-v1.35.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/container/com_google_cloud_go_container-v1.35.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/container/com_google_cloud_go_container-v1.35.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_containeranalysis",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/containeranalysis",
        sha256 = "033998ae5653d104c29595f5c282c4bec82ed0ca1293ad063687f57be396ae33",
        strip_prefix = "cloud.google.com/go/containeranalysis@v0.11.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/containeranalysis/com_google_cloud_go_containeranalysis-v0.11.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/containeranalysis/com_google_cloud_go_containeranalysis-v0.11.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/containeranalysis/com_google_cloud_go_containeranalysis-v0.11.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/containeranalysis/com_google_cloud_go_containeranalysis-v0.11.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_datacatalog",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/datacatalog",
        sha256 = "445f8af59920f2119e1ef8a6064b2363c3498eabefb460c53c2b5a6826a008c7",
        strip_prefix = "cloud.google.com/go/datacatalog@v1.20.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/datacatalog/com_google_cloud_go_datacatalog-v1.20.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/datacatalog/com_google_cloud_go_datacatalog-v1.20.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/datacatalog/com_google_cloud_go_datacatalog-v1.20.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/datacatalog/com_google_cloud_go_datacatalog-v1.20.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dataflow",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dataflow",
        sha256 = "9959e754b4d6164a87018a6ec1c247864236affcee8715cb645ca0639042b0d3",
        strip_prefix = "cloud.google.com/go/dataflow@v0.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dataflow/com_google_cloud_go_dataflow-v0.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dataflow/com_google_cloud_go_dataflow-v0.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dataflow/com_google_cloud_go_dataflow-v0.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dataflow/com_google_cloud_go_dataflow-v0.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dataform",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dataform",
        sha256 = "c60752c51194d4a0cfd26b7783e6813a1586041609d8dafee6a4f73b123fee8d",
        strip_prefix = "cloud.google.com/go/dataform@v0.9.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dataform/com_google_cloud_go_dataform-v0.9.3.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dataform/com_google_cloud_go_dataform-v0.9.3.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dataform/com_google_cloud_go_dataform-v0.9.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dataform/com_google_cloud_go_dataform-v0.9.3.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_datafusion",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/datafusion",
        sha256 = "9ee79e05a3234462f64d009d490fdefb455e3a0802f118726a90ecc92315adf2",
        strip_prefix = "cloud.google.com/go/datafusion@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/datafusion/com_google_cloud_go_datafusion-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/datafusion/com_google_cloud_go_datafusion-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/datafusion/com_google_cloud_go_datafusion-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/datafusion/com_google_cloud_go_datafusion-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_datalabeling",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/datalabeling",
        sha256 = "bd62c81f4b68de677018317116c90b1e66a1989d4ac02d6fe2e5df2f687debdc",
        strip_prefix = "cloud.google.com/go/datalabeling@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/datalabeling/com_google_cloud_go_datalabeling-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/datalabeling/com_google_cloud_go_datalabeling-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/datalabeling/com_google_cloud_go_datalabeling-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/datalabeling/com_google_cloud_go_datalabeling-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dataplex",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dataplex",
        sha256 = "8996d48fc33e1e371a9b9f58dfafbf046d8b89c534a8431400247dd990596d9b",
        strip_prefix = "cloud.google.com/go/dataplex@v1.15.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dataplex/com_google_cloud_go_dataplex-v1.15.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dataplex/com_google_cloud_go_dataplex-v1.15.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dataplex/com_google_cloud_go_dataplex-v1.15.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dataplex/com_google_cloud_go_dataplex-v1.15.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dataproc_v2",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dataproc/v2",
        sha256 = "8e90936ef4ffbb935a319d5b92fcaf9ef2d7c8fb15e53a473a6bbd24aaf04038",
        strip_prefix = "cloud.google.com/go/dataproc/v2@v2.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dataproc/v2/com_google_cloud_go_dataproc_v2-v2.4.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dataproc/v2/com_google_cloud_go_dataproc_v2-v2.4.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dataproc/v2/com_google_cloud_go_dataproc_v2-v2.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dataproc/v2/com_google_cloud_go_dataproc_v2-v2.4.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dataqna",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dataqna",
        sha256 = "07e7d985f317ff2dc73960cc0160e9c08594eceb803a0d50187b2164e8ae391b",
        strip_prefix = "cloud.google.com/go/dataqna@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dataqna/com_google_cloud_go_dataqna-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dataqna/com_google_cloud_go_dataqna-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dataqna/com_google_cloud_go_dataqna-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dataqna/com_google_cloud_go_dataqna-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_datastore",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/datastore",
        sha256 = "8b89b61b9655adcfb197079184d0438dc15fc12aa7c3ef72f61fa8ddbad22880",
        strip_prefix = "cloud.google.com/go/datastore@v1.15.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/datastore/com_google_cloud_go_datastore-v1.15.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/datastore/com_google_cloud_go_datastore-v1.15.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/datastore/com_google_cloud_go_datastore-v1.15.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/datastore/com_google_cloud_go_datastore-v1.15.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_datastream",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/datastream",
        sha256 = "983f8e50bdd7b2c9a80cbb45f91c42c0c220dcfa221587f94cbdf15a8c40089b",
        strip_prefix = "cloud.google.com/go/datastream@v1.10.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/datastream/com_google_cloud_go_datastream-v1.10.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/datastream/com_google_cloud_go_datastream-v1.10.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/datastream/com_google_cloud_go_datastream-v1.10.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/datastream/com_google_cloud_go_datastream-v1.10.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_deploy",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/deploy",
        sha256 = "9c4b4c0e47524721843458e066459d843248f244b8c2154ca936ff127abd7a56",
        strip_prefix = "cloud.google.com/go/deploy@v1.17.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/deploy/com_google_cloud_go_deploy-v1.17.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/deploy/com_google_cloud_go_deploy-v1.17.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/deploy/com_google_cloud_go_deploy-v1.17.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/deploy/com_google_cloud_go_deploy-v1.17.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dialogflow",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dialogflow",
        sha256 = "80c5619aca0ba08e0483b8b20222697d45040da5eea5ef6c9290e62e45d9e549",
        strip_prefix = "cloud.google.com/go/dialogflow@v1.52.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dialogflow/com_google_cloud_go_dialogflow-v1.52.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dialogflow/com_google_cloud_go_dialogflow-v1.52.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dialogflow/com_google_cloud_go_dialogflow-v1.52.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dialogflow/com_google_cloud_go_dialogflow-v1.52.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_dlp",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/dlp",
        sha256 = "d4c86ca0d382759f5c802d5987337c2631bafbafa85995f339e55dd774ae4f16",
        strip_prefix = "cloud.google.com/go/dlp@v1.12.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/dlp/com_google_cloud_go_dlp-v1.12.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/dlp/com_google_cloud_go_dlp-v1.12.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/dlp/com_google_cloud_go_dlp-v1.12.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/dlp/com_google_cloud_go_dlp-v1.12.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_documentai",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/documentai",
        sha256 = "71f745236d7bd365771a44be585ed31cfa79ea2dc0b5cc89ba7cdafed43d5132",
        strip_prefix = "cloud.google.com/go/documentai@v1.26.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/documentai/com_google_cloud_go_documentai-v1.26.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/documentai/com_google_cloud_go_documentai-v1.26.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/documentai/com_google_cloud_go_documentai-v1.26.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/documentai/com_google_cloud_go_documentai-v1.26.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_domains",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/domains",
        sha256 = "772c772d561a92b66fb978d71299b3ef07f5aa1ce362df12edfa45745ebaa355",
        strip_prefix = "cloud.google.com/go/domains@v0.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/domains/com_google_cloud_go_domains-v0.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/domains/com_google_cloud_go_domains-v0.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/domains/com_google_cloud_go_domains-v0.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/domains/com_google_cloud_go_domains-v0.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_edgecontainer",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/edgecontainer",
        sha256 = "6dd475039505a211b05d54e33059b9671010c0249e6a3eef68749e0dfad0f3d5",
        strip_prefix = "cloud.google.com/go/edgecontainer@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/edgecontainer/com_google_cloud_go_edgecontainer-v1.2.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/edgecontainer/com_google_cloud_go_edgecontainer-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/edgecontainer/com_google_cloud_go_edgecontainer-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/edgecontainer/com_google_cloud_go_edgecontainer-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_errorreporting",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/errorreporting",
        sha256 = "7b6ee6ab85d13d042543e1f2eff7e4c73104ba76981a85a6aed7dc302cf20585",
        strip_prefix = "cloud.google.com/go/errorreporting@v0.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/errorreporting/com_google_cloud_go_errorreporting-v0.3.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/errorreporting/com_google_cloud_go_errorreporting-v0.3.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/errorreporting/com_google_cloud_go_errorreporting-v0.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/errorreporting/com_google_cloud_go_errorreporting-v0.3.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_essentialcontacts",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/essentialcontacts",
        sha256 = "74db79783193980da3c7a7c7efb2bb0604e1d3bcb4b5f340c9b9e2c7b107ba0c",
        strip_prefix = "cloud.google.com/go/essentialcontacts@v1.6.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/essentialcontacts/com_google_cloud_go_essentialcontacts-v1.6.7.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/essentialcontacts/com_google_cloud_go_essentialcontacts-v1.6.7.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/essentialcontacts/com_google_cloud_go_essentialcontacts-v1.6.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/essentialcontacts/com_google_cloud_go_essentialcontacts-v1.6.7.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_eventarc",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/eventarc",
        sha256 = "d7f54c4d23842104f0d75f8ca65cf7b1beabfa9e1318670ed0643fedcf3af19f",
        strip_prefix = "cloud.google.com/go/eventarc@v1.13.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/eventarc/com_google_cloud_go_eventarc-v1.13.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/eventarc/com_google_cloud_go_eventarc-v1.13.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/eventarc/com_google_cloud_go_eventarc-v1.13.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/eventarc/com_google_cloud_go_eventarc-v1.13.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_filestore",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/filestore",
        sha256 = "d2e3f0e37f7ddf815e954ce77620b0e42b4f6c99c1ba58969f534e6ad0be4908",
        strip_prefix = "cloud.google.com/go/filestore@v1.8.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/filestore/com_google_cloud_go_filestore-v1.8.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/filestore/com_google_cloud_go_filestore-v1.8.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/filestore/com_google_cloud_go_filestore-v1.8.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/filestore/com_google_cloud_go_filestore-v1.8.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_firestore",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/firestore",
        sha256 = "580cc787e73def539d8b567876634758195d5d269d9fc7ec701fe488da0d7edd",
        strip_prefix = "cloud.google.com/go/firestore@v1.15.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/firestore/com_google_cloud_go_firestore-v1.15.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/firestore/com_google_cloud_go_firestore-v1.15.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/firestore/com_google_cloud_go_firestore-v1.15.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/firestore/com_google_cloud_go_firestore-v1.15.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_functions",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/functions",
        sha256 = "fd40cb7094ad39a66fa48388476ba96cb40659437133a2d72d37ea8b9b6a61e1",
        strip_prefix = "cloud.google.com/go/functions@v1.16.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/functions/com_google_cloud_go_functions-v1.16.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/functions/com_google_cloud_go_functions-v1.16.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/functions/com_google_cloud_go_functions-v1.16.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/functions/com_google_cloud_go_functions-v1.16.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_gkebackup",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/gkebackup",
        sha256 = "45c2933f547c9a387f15a223240278e7ad34ec249a2bbaf22449ead192885dee",
        strip_prefix = "cloud.google.com/go/gkebackup@v1.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/gkebackup/com_google_cloud_go_gkebackup-v1.4.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/gkebackup/com_google_cloud_go_gkebackup-v1.4.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/gkebackup/com_google_cloud_go_gkebackup-v1.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/gkebackup/com_google_cloud_go_gkebackup-v1.4.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_gkeconnect",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/gkeconnect",
        sha256 = "54ca0fa601687b58da2361344be341be5bc44373a3a0b21b6562d7225917fc29",
        strip_prefix = "cloud.google.com/go/gkeconnect@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/gkeconnect/com_google_cloud_go_gkeconnect-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/gkeconnect/com_google_cloud_go_gkeconnect-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/gkeconnect/com_google_cloud_go_gkeconnect-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/gkeconnect/com_google_cloud_go_gkeconnect-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_gkehub",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/gkehub",
        sha256 = "e3f2300886ed800b820f592f63968829a0b52fe78e0cc4bcebe2b52b0aba311f",
        strip_prefix = "cloud.google.com/go/gkehub@v0.14.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/gkehub/com_google_cloud_go_gkehub-v0.14.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/gkehub/com_google_cloud_go_gkehub-v0.14.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/gkehub/com_google_cloud_go_gkehub-v0.14.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/gkehub/com_google_cloud_go_gkehub-v0.14.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_gkemulticloud",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/gkemulticloud",
        sha256 = "85bbe6ca4d34043e49eec2e3527acb6d9b4d23cd38c65710d3498b3d901cdee4",
        strip_prefix = "cloud.google.com/go/gkemulticloud@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/gkemulticloud/com_google_cloud_go_gkemulticloud-v1.1.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/gkemulticloud/com_google_cloud_go_gkemulticloud-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/gkemulticloud/com_google_cloud_go_gkemulticloud-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/gkemulticloud/com_google_cloud_go_gkemulticloud-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_gsuiteaddons",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/gsuiteaddons",
        sha256 = "323362296193aa3881290aa04ea9325f8bd4c3e93c5c5edc7042b0e9881171fc",
        strip_prefix = "cloud.google.com/go/gsuiteaddons@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/gsuiteaddons/com_google_cloud_go_gsuiteaddons-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/gsuiteaddons/com_google_cloud_go_gsuiteaddons-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/gsuiteaddons/com_google_cloud_go_gsuiteaddons-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/gsuiteaddons/com_google_cloud_go_gsuiteaddons-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_iam",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/iam",
        sha256 = "a4e11b559105ad686bd085ab5538701f89bf779381392aeb2d2803f470e1b16b",
        strip_prefix = "cloud.google.com/go/iam@v1.1.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/iam/com_google_cloud_go_iam-v1.1.7.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/iam/com_google_cloud_go_iam-v1.1.7.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/iam/com_google_cloud_go_iam-v1.1.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/iam/com_google_cloud_go_iam-v1.1.7.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_iap",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/iap",
        sha256 = "14f98a19725eca0f0aef1ffec6f82aa478198044b0dd1ab5ba16e754596fd2a9",
        strip_prefix = "cloud.google.com/go/iap@v1.9.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/iap/com_google_cloud_go_iap-v1.9.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/iap/com_google_cloud_go_iap-v1.9.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/iap/com_google_cloud_go_iap-v1.9.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/iap/com_google_cloud_go_iap-v1.9.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_ids",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/ids",
        sha256 = "0e0d05e750c8f39c50c12dee1fa233a518c0bc9688fb3369233408e51fbacde9",
        strip_prefix = "cloud.google.com/go/ids@v1.4.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/ids/com_google_cloud_go_ids-v1.4.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/ids/com_google_cloud_go_ids-v1.4.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/ids/com_google_cloud_go_ids-v1.4.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/ids/com_google_cloud_go_ids-v1.4.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_iot",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/iot",
        sha256 = "c16b70bfdb510970632c37e30a71cd0da144249a4941ed5c81135c6e3aa9a75c",
        strip_prefix = "cloud.google.com/go/iot@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/iot/com_google_cloud_go_iot-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/iot/com_google_cloud_go_iot-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/iot/com_google_cloud_go_iot-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/iot/com_google_cloud_go_iot-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_kms",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/kms",
        sha256 = "492550f75abeb542395dfbc1afb41c4ceed4ea40ac7b51458cc870fb4adbd884",
        strip_prefix = "cloud.google.com/go/kms@v1.15.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/kms/com_google_cloud_go_kms-v1.15.8.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/kms/com_google_cloud_go_kms-v1.15.8.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/kms/com_google_cloud_go_kms-v1.15.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/kms/com_google_cloud_go_kms-v1.15.8.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_language",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/language",
        sha256 = "4f67344bfd44548f07bbf193cf145b4e277e3905c50259898ee37d60b855cb1a",
        strip_prefix = "cloud.google.com/go/language@v1.12.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/language/com_google_cloud_go_language-v1.12.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/language/com_google_cloud_go_language-v1.12.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/language/com_google_cloud_go_language-v1.12.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/language/com_google_cloud_go_language-v1.12.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_lifesciences",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/lifesciences",
        sha256 = "299df4b8a782aa1e4917e86c3cc9fcd8d9697ae3156e07df08d87bdc618b52da",
        strip_prefix = "cloud.google.com/go/lifesciences@v0.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/lifesciences/com_google_cloud_go_lifesciences-v0.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/lifesciences/com_google_cloud_go_lifesciences-v0.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/lifesciences/com_google_cloud_go_lifesciences-v0.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/lifesciences/com_google_cloud_go_lifesciences-v0.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_logging",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/logging",
        sha256 = "abc0c1703a42cbbd58108e003596bb3c803847c28a9df43354dd9f8a1a55b4b8",
        strip_prefix = "cloud.google.com/go/logging@v1.9.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/logging/com_google_cloud_go_logging-v1.9.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/logging/com_google_cloud_go_logging-v1.9.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/logging/com_google_cloud_go_logging-v1.9.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/logging/com_google_cloud_go_logging-v1.9.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_longrunning",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/longrunning",
        sha256 = "3a2d8b2bee619ed686d94fae5f99c8fca7eb69e5343892561c1b89816d6d1297",
        strip_prefix = "cloud.google.com/go/longrunning@v0.5.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/longrunning/com_google_cloud_go_longrunning-v0.5.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/longrunning/com_google_cloud_go_longrunning-v0.5.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/longrunning/com_google_cloud_go_longrunning-v0.5.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/longrunning/com_google_cloud_go_longrunning-v0.5.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_managedidentities",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/managedidentities",
        sha256 = "de12cf5b96770e3fd5af32f0500a8a6f3464bb133bdb1bfaa5583ce617631532",
        strip_prefix = "cloud.google.com/go/managedidentities@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/managedidentities/com_google_cloud_go_managedidentities-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/managedidentities/com_google_cloud_go_managedidentities-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/managedidentities/com_google_cloud_go_managedidentities-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/managedidentities/com_google_cloud_go_managedidentities-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_maps",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/maps",
        sha256 = "efbceffb02f1d34a36af4eeb9817045d20c85be929329ba511b0929b6abab86e",
        strip_prefix = "cloud.google.com/go/maps@v1.7.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/maps/com_google_cloud_go_maps-v1.7.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/maps/com_google_cloud_go_maps-v1.7.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/maps/com_google_cloud_go_maps-v1.7.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/maps/com_google_cloud_go_maps-v1.7.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_mediatranslation",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/mediatranslation",
        sha256 = "7cba5bc0d01da1525d13f5b5cf02d775ad263e0575353db7f48dcf1e2b97fb91",
        strip_prefix = "cloud.google.com/go/mediatranslation@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/mediatranslation/com_google_cloud_go_mediatranslation-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/mediatranslation/com_google_cloud_go_mediatranslation-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/mediatranslation/com_google_cloud_go_mediatranslation-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/mediatranslation/com_google_cloud_go_mediatranslation-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_memcache",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/memcache",
        sha256 = "e24961deeb8ca81c3647409b397fd69835565ab1323e18cc73d6f957d671697c",
        strip_prefix = "cloud.google.com/go/memcache@v1.10.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/memcache/com_google_cloud_go_memcache-v1.10.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/memcache/com_google_cloud_go_memcache-v1.10.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/memcache/com_google_cloud_go_memcache-v1.10.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/memcache/com_google_cloud_go_memcache-v1.10.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_metastore",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/metastore",
        sha256 = "21efcf2b4458c70931f198d0b71ef215f9beca53bd50df2c7b7e7336f99ffdc8",
        strip_prefix = "cloud.google.com/go/metastore@v1.13.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/metastore/com_google_cloud_go_metastore-v1.13.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/metastore/com_google_cloud_go_metastore-v1.13.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/metastore/com_google_cloud_go_metastore-v1.13.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/metastore/com_google_cloud_go_metastore-v1.13.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_monitoring",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/monitoring",
        sha256 = "bba439d0b7a5b56c115aec2c8bcddda9694076e6be79503bf5ed2fd21e2daf14",
        strip_prefix = "cloud.google.com/go/monitoring@v1.18.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/monitoring/com_google_cloud_go_monitoring-v1.18.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/monitoring/com_google_cloud_go_monitoring-v1.18.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/monitoring/com_google_cloud_go_monitoring-v1.18.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/monitoring/com_google_cloud_go_monitoring-v1.18.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_networkconnectivity",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/networkconnectivity",
        sha256 = "86f8ff1a77fa0defd9b7dd9286cbfd91eef06fe5e1c1720582c0ce094150f5ad",
        strip_prefix = "cloud.google.com/go/networkconnectivity@v1.14.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/networkconnectivity/com_google_cloud_go_networkconnectivity-v1.14.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/networkconnectivity/com_google_cloud_go_networkconnectivity-v1.14.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/networkconnectivity/com_google_cloud_go_networkconnectivity-v1.14.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/networkconnectivity/com_google_cloud_go_networkconnectivity-v1.14.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_networkmanagement",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/networkmanagement",
        sha256 = "c7a2ef332b414a90e364e619a8757ad013c76aea4953c4fdf6a9495f98f3c50a",
        strip_prefix = "cloud.google.com/go/networkmanagement@v1.13.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/networkmanagement/com_google_cloud_go_networkmanagement-v1.13.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/networkmanagement/com_google_cloud_go_networkmanagement-v1.13.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/networkmanagement/com_google_cloud_go_networkmanagement-v1.13.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/networkmanagement/com_google_cloud_go_networkmanagement-v1.13.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_networksecurity",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/networksecurity",
        sha256 = "601ba38dbd21349c96d591aeae55b5eeaed23dc958f389108e3d635bd2cc9e10",
        strip_prefix = "cloud.google.com/go/networksecurity@v0.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/networksecurity/com_google_cloud_go_networksecurity-v0.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/networksecurity/com_google_cloud_go_networksecurity-v0.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/networksecurity/com_google_cloud_go_networksecurity-v0.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/networksecurity/com_google_cloud_go_networksecurity-v0.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_notebooks",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/notebooks",
        sha256 = "481b201b21d54273a46f3e07d6266820e245e5317320490fe56511a8a955f41d",
        strip_prefix = "cloud.google.com/go/notebooks@v1.11.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/notebooks/com_google_cloud_go_notebooks-v1.11.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/notebooks/com_google_cloud_go_notebooks-v1.11.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/notebooks/com_google_cloud_go_notebooks-v1.11.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/notebooks/com_google_cloud_go_notebooks-v1.11.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_optimization",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/optimization",
        sha256 = "2e5a7bf8525f76d96d49a816e7b87673d26fe3ad2fb55252a8cda9776d512a73",
        strip_prefix = "cloud.google.com/go/optimization@v1.6.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/optimization/com_google_cloud_go_optimization-v1.6.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/optimization/com_google_cloud_go_optimization-v1.6.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/optimization/com_google_cloud_go_optimization-v1.6.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/optimization/com_google_cloud_go_optimization-v1.6.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_orchestration",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/orchestration",
        sha256 = "7cbcfba68f98ace3a83d27b5a21649fc5c1c6313f2ae865f69d34092701a56ab",
        strip_prefix = "cloud.google.com/go/orchestration@v1.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/orchestration/com_google_cloud_go_orchestration-v1.9.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/orchestration/com_google_cloud_go_orchestration-v1.9.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/orchestration/com_google_cloud_go_orchestration-v1.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/orchestration/com_google_cloud_go_orchestration-v1.9.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_orgpolicy",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/orgpolicy",
        sha256 = "34185074647cfbb6753c1e557584b3e8191e3b61e0d5c45063530cd4f3894e3f",
        strip_prefix = "cloud.google.com/go/orgpolicy@v1.12.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/orgpolicy/com_google_cloud_go_orgpolicy-v1.12.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/orgpolicy/com_google_cloud_go_orgpolicy-v1.12.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/orgpolicy/com_google_cloud_go_orgpolicy-v1.12.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/orgpolicy/com_google_cloud_go_orgpolicy-v1.12.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_osconfig",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/osconfig",
        sha256 = "3ec14ddf4a1b4a5b9b86f4642baf38c3f9fc3c7f6e95b023a604f60947e1012e",
        strip_prefix = "cloud.google.com/go/osconfig@v1.12.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/osconfig/com_google_cloud_go_osconfig-v1.12.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/osconfig/com_google_cloud_go_osconfig-v1.12.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/osconfig/com_google_cloud_go_osconfig-v1.12.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/osconfig/com_google_cloud_go_osconfig-v1.12.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_oslogin",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/oslogin",
        sha256 = "750257ef37ea0c52653856873b54af8510b8a9d8613ab375abed9e48395a087d",
        strip_prefix = "cloud.google.com/go/oslogin@v1.13.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/oslogin/com_google_cloud_go_oslogin-v1.13.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/oslogin/com_google_cloud_go_oslogin-v1.13.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/oslogin/com_google_cloud_go_oslogin-v1.13.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/oslogin/com_google_cloud_go_oslogin-v1.13.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_phishingprotection",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/phishingprotection",
        sha256 = "6df6a3827196206a56a7d19b82b206a17682f3cccd36b614da0a5c6c2f2e7f0b",
        strip_prefix = "cloud.google.com/go/phishingprotection@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/phishingprotection/com_google_cloud_go_phishingprotection-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/phishingprotection/com_google_cloud_go_phishingprotection-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/phishingprotection/com_google_cloud_go_phishingprotection-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/phishingprotection/com_google_cloud_go_phishingprotection-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_policytroubleshooter",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/policytroubleshooter",
        sha256 = "d4b3123612454faee6ac9ef88e0d781b918a95d6645fe7be3f22849676ab83a3",
        strip_prefix = "cloud.google.com/go/policytroubleshooter@v1.10.4",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/policytroubleshooter/com_google_cloud_go_policytroubleshooter-v1.10.4.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/policytroubleshooter/com_google_cloud_go_policytroubleshooter-v1.10.4.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/policytroubleshooter/com_google_cloud_go_policytroubleshooter-v1.10.4.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/policytroubleshooter/com_google_cloud_go_policytroubleshooter-v1.10.4.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_privatecatalog",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/privatecatalog",
        sha256 = "e9c8e23974367cf360e0ee17bc55f3cf7e20f8fb6932cee50250755cb973df25",
        strip_prefix = "cloud.google.com/go/privatecatalog@v0.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/privatecatalog/com_google_cloud_go_privatecatalog-v0.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/privatecatalog/com_google_cloud_go_privatecatalog-v0.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/privatecatalog/com_google_cloud_go_privatecatalog-v0.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/privatecatalog/com_google_cloud_go_privatecatalog-v0.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_pubsub",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/pubsub",
        sha256 = "c468d224c042a7e23b021ae1df3870f6aad4b7fb8982c02756e18ec7b7d80c2d",
        strip_prefix = "cloud.google.com/go/pubsub@v1.37.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/pubsub/com_google_cloud_go_pubsub-v1.37.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/pubsub/com_google_cloud_go_pubsub-v1.37.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/pubsub/com_google_cloud_go_pubsub-v1.37.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/pubsub/com_google_cloud_go_pubsub-v1.37.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_pubsublite",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/pubsublite",
        sha256 = "41933a60c5e0995025320fe1c155b31d636178e60838b04aca9eab0c8c9f3227",
        strip_prefix = "cloud.google.com/go/pubsublite@v1.8.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/pubsublite/com_google_cloud_go_pubsublite-v1.8.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/pubsublite/com_google_cloud_go_pubsublite-v1.8.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/pubsublite/com_google_cloud_go_pubsublite-v1.8.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/pubsublite/com_google_cloud_go_pubsublite-v1.8.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_recaptchaenterprise_v2",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/recaptchaenterprise/v2",
        sha256 = "924a9dfdd5a18ceff030b3fd1c7294770a754f07d6fd327a533cad13dd62cd5a",
        strip_prefix = "cloud.google.com/go/recaptchaenterprise/v2@v2.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/recaptchaenterprise/v2/com_google_cloud_go_recaptchaenterprise_v2-v2.12.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/recaptchaenterprise/v2/com_google_cloud_go_recaptchaenterprise_v2-v2.12.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/recaptchaenterprise/v2/com_google_cloud_go_recaptchaenterprise_v2-v2.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/recaptchaenterprise/v2/com_google_cloud_go_recaptchaenterprise_v2-v2.12.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_recommendationengine",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/recommendationengine",
        sha256 = "607da8589ff31ec8822c4ac3dcc2176d4888cb4601fcc6b2d7718234ee579118",
        strip_prefix = "cloud.google.com/go/recommendationengine@v0.8.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/recommendationengine/com_google_cloud_go_recommendationengine-v0.8.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/recommendationengine/com_google_cloud_go_recommendationengine-v0.8.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/recommendationengine/com_google_cloud_go_recommendationengine-v0.8.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/recommendationengine/com_google_cloud_go_recommendationengine-v0.8.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_recommender",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/recommender",
        sha256 = "9ac2adc5ec13ef57b64e20160e8704685b660190cd46a25728f96a298503fdb0",
        strip_prefix = "cloud.google.com/go/recommender@v1.12.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/recommender/com_google_cloud_go_recommender-v1.12.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/recommender/com_google_cloud_go_recommender-v1.12.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/recommender/com_google_cloud_go_recommender-v1.12.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/recommender/com_google_cloud_go_recommender-v1.12.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_redis",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/redis",
        sha256 = "4325ff29f55cb8511756f32ef2b6f02ffeda2371dad7f7e5efe4d4fb4a5b04e9",
        strip_prefix = "cloud.google.com/go/redis@v1.14.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/redis/com_google_cloud_go_redis-v1.14.3.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/redis/com_google_cloud_go_redis-v1.14.3.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/redis/com_google_cloud_go_redis-v1.14.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/redis/com_google_cloud_go_redis-v1.14.3.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_resourcemanager",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/resourcemanager",
        sha256 = "65788e8dad280b1afe3d09c37cd2873be7c2d9e3b4b4e37ea04ec6dea917f6d6",
        strip_prefix = "cloud.google.com/go/resourcemanager@v1.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/resourcemanager/com_google_cloud_go_resourcemanager-v1.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/resourcemanager/com_google_cloud_go_resourcemanager-v1.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/resourcemanager/com_google_cloud_go_resourcemanager-v1.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/resourcemanager/com_google_cloud_go_resourcemanager-v1.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_resourcesettings",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/resourcesettings",
        sha256 = "56e7da8a780260123ea423b628918d0e807603072684d5785d759ec250e5fd7d",
        strip_prefix = "cloud.google.com/go/resourcesettings@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/resourcesettings/com_google_cloud_go_resourcesettings-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/resourcesettings/com_google_cloud_go_resourcesettings-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/resourcesettings/com_google_cloud_go_resourcesettings-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/resourcesettings/com_google_cloud_go_resourcesettings-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_retail",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/retail",
        sha256 = "5a3b6e9ba0c4f8221d171fd43d60a39a1876b86c238568f9f1954452e0434401",
        strip_prefix = "cloud.google.com/go/retail@v1.16.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/retail/com_google_cloud_go_retail-v1.16.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/retail/com_google_cloud_go_retail-v1.16.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/retail/com_google_cloud_go_retail-v1.16.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/retail/com_google_cloud_go_retail-v1.16.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_run",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/run",
        sha256 = "478517efe84510683418caabcb31475281106bfa7b047ae85ac3acd28075139c",
        strip_prefix = "cloud.google.com/go/run@v1.3.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/run/com_google_cloud_go_run-v1.3.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/run/com_google_cloud_go_run-v1.3.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/run/com_google_cloud_go_run-v1.3.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/run/com_google_cloud_go_run-v1.3.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_scheduler",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/scheduler",
        sha256 = "5e44f558c0aa29efea7ecdb859474d6aad2947366b89e42f02e723513068743c",
        strip_prefix = "cloud.google.com/go/scheduler@v1.10.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/scheduler/com_google_cloud_go_scheduler-v1.10.7.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/scheduler/com_google_cloud_go_scheduler-v1.10.7.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/scheduler/com_google_cloud_go_scheduler-v1.10.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/scheduler/com_google_cloud_go_scheduler-v1.10.7.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_secretmanager",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/secretmanager",
        sha256 = "7e152ee11f0dee66c40e009127ba823d4b755eefa0a0b44d7bdc80636caf5e41",
        strip_prefix = "cloud.google.com/go/secretmanager@v1.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/secretmanager/com_google_cloud_go_secretmanager-v1.12.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/secretmanager/com_google_cloud_go_secretmanager-v1.12.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/secretmanager/com_google_cloud_go_secretmanager-v1.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/secretmanager/com_google_cloud_go_secretmanager-v1.12.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_security",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/security",
        sha256 = "30614f4b20cd36d6394f1bc60e2380b7dab3449e28320a6856fc0019d267e05d",
        strip_prefix = "cloud.google.com/go/security@v1.15.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/security/com_google_cloud_go_security-v1.15.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/security/com_google_cloud_go_security-v1.15.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/security/com_google_cloud_go_security-v1.15.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/security/com_google_cloud_go_security-v1.15.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_securitycenter",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/securitycenter",
        sha256 = "1c427560d47ba37c5871e5af8f84d7fd86a796c39f6f5c8ca0b888fea778bcb1",
        strip_prefix = "cloud.google.com/go/securitycenter@v1.28.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/securitycenter/com_google_cloud_go_securitycenter-v1.28.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/securitycenter/com_google_cloud_go_securitycenter-v1.28.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/securitycenter/com_google_cloud_go_securitycenter-v1.28.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/securitycenter/com_google_cloud_go_securitycenter-v1.28.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_servicedirectory",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/servicedirectory",
        sha256 = "40240f7a666c469f7aea7dab67aa38e1554dc6f6ed15ec7c618918b5208e3106",
        strip_prefix = "cloud.google.com/go/servicedirectory@v1.11.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/servicedirectory/com_google_cloud_go_servicedirectory-v1.11.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/servicedirectory/com_google_cloud_go_servicedirectory-v1.11.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/servicedirectory/com_google_cloud_go_servicedirectory-v1.11.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/servicedirectory/com_google_cloud_go_servicedirectory-v1.11.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_shell",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/shell",
        sha256 = "258bca8529cdaca4482e7fda6374f29dc2e5f60719cb85e8e7e4b66c09042ac8",
        strip_prefix = "cloud.google.com/go/shell@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/shell/com_google_cloud_go_shell-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/shell/com_google_cloud_go_shell-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/shell/com_google_cloud_go_shell-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/shell/com_google_cloud_go_shell-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_spanner",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/spanner",
        sha256 = "92a6177e00c13a9abb0abc84a0908999e58870ac3ef56dfcd6aedbf488c121d8",
        strip_prefix = "cloud.google.com/go/spanner@v1.60.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/spanner/com_google_cloud_go_spanner-v1.60.0.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/spanner/com_google_cloud_go_spanner-v1.60.0.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/spanner/com_google_cloud_go_spanner-v1.60.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/spanner/com_google_cloud_go_spanner-v1.60.0.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_speech",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/speech",
        sha256 = "74a45f528fe5fc655f853b47bba22097ab873eb08576b2f57da44ca207e29e1d",
        strip_prefix = "cloud.google.com/go/speech@v1.22.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/speech/com_google_cloud_go_speech-v1.22.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/speech/com_google_cloud_go_speech-v1.22.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/speech/com_google_cloud_go_speech-v1.22.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/speech/com_google_cloud_go_speech-v1.22.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_storage",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/storage",
        sha256 = "d2296c14f33f75e11ac4f525a8280d1f828a00460ca7c15d32c6fa18f25c68a1",
        strip_prefix = "cloud.google.com/go/storage@v1.39.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/storage/com_google_cloud_go_storage-v1.39.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/storage/com_google_cloud_go_storage-v1.39.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/storage/com_google_cloud_go_storage-v1.39.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/storage/com_google_cloud_go_storage-v1.39.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_storagetransfer",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/storagetransfer",
        sha256 = "9ebee1dadb761bd2ec52915ef2cbd876b139463ef1b2e9e0da9bcfaa5a63efad",
        strip_prefix = "cloud.google.com/go/storagetransfer@v1.10.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/storagetransfer/com_google_cloud_go_storagetransfer-v1.10.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/storagetransfer/com_google_cloud_go_storagetransfer-v1.10.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/storagetransfer/com_google_cloud_go_storagetransfer-v1.10.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/storagetransfer/com_google_cloud_go_storagetransfer-v1.10.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_talent",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/talent",
        sha256 = "5d9acef2e8037d33c8f5c7629529192e021a292a5acf673da77e4133511adc3c",
        strip_prefix = "cloud.google.com/go/talent@v1.6.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/talent/com_google_cloud_go_talent-v1.6.7.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/talent/com_google_cloud_go_talent-v1.6.7.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/talent/com_google_cloud_go_talent-v1.6.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/talent/com_google_cloud_go_talent-v1.6.7.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_texttospeech",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/texttospeech",
        sha256 = "362cc2223276ae56bc1045f8e95e6ae88feac8749063a816bee899262e8562f7",
        strip_prefix = "cloud.google.com/go/texttospeech@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/texttospeech/com_google_cloud_go_texttospeech-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/texttospeech/com_google_cloud_go_texttospeech-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/texttospeech/com_google_cloud_go_texttospeech-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/texttospeech/com_google_cloud_go_texttospeech-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_tpu",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/tpu",
        sha256 = "7e48b694da01ab77305740c26aadf803f0062afc338e9f7e595022eb83ae4e74",
        strip_prefix = "cloud.google.com/go/tpu@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/tpu/com_google_cloud_go_tpu-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/tpu/com_google_cloud_go_tpu-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/tpu/com_google_cloud_go_tpu-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/tpu/com_google_cloud_go_tpu-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_trace",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/trace",
        sha256 = "3f5a9f90b85b2495723861237b2eb5b68553103cd4b75c0d121182cc31c6e01d",
        strip_prefix = "cloud.google.com/go/trace@v1.10.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/trace/com_google_cloud_go_trace-v1.10.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/trace/com_google_cloud_go_trace-v1.10.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/trace/com_google_cloud_go_trace-v1.10.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/trace/com_google_cloud_go_trace-v1.10.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_translate",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/translate",
        sha256 = "78f8a4005f3b12eef217ad516a525d5eec41654fdf82fb2f41d73004214fdb3d",
        strip_prefix = "cloud.google.com/go/translate@v1.10.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/translate/com_google_cloud_go_translate-v1.10.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/translate/com_google_cloud_go_translate-v1.10.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/translate/com_google_cloud_go_translate-v1.10.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/translate/com_google_cloud_go_translate-v1.10.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_video",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/video",
        sha256 = "780e7ab4bd303e5beaf6e3ab82e3c7d1bfa081bf01853c47aa7e3f940212130a",
        strip_prefix = "cloud.google.com/go/video@v1.20.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/video/com_google_cloud_go_video-v1.20.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/video/com_google_cloud_go_video-v1.20.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/video/com_google_cloud_go_video-v1.20.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/video/com_google_cloud_go_video-v1.20.5.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_videointelligence",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/videointelligence",
        sha256 = "9961319a5aaeb6ffd1df671dcf81941d8ff8f5f35440e17e434148c8586e9d7b",
        strip_prefix = "cloud.google.com/go/videointelligence@v1.11.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/videointelligence/com_google_cloud_go_videointelligence-v1.11.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/videointelligence/com_google_cloud_go_videointelligence-v1.11.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/videointelligence/com_google_cloud_go_videointelligence-v1.11.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/videointelligence/com_google_cloud_go_videointelligence-v1.11.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_vision_v2",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/vision/v2",
        sha256 = "2ae5b457cfe0c3efe0e0efb88724131719bc9702120fb5bc8e15f5ece6476a15",
        strip_prefix = "cloud.google.com/go/vision/v2@v2.8.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/vision/v2/com_google_cloud_go_vision_v2-v2.8.1.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/vision/v2/com_google_cloud_go_vision_v2-v2.8.1.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/vision/v2/com_google_cloud_go_vision_v2-v2.8.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/vision/v2/com_google_cloud_go_vision_v2-v2.8.1.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_vmmigration",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/vmmigration",
        sha256 = "d5705cb299663a4a0dff323d19d72061dac7569182a94f8b304cafc270440034",
        strip_prefix = "cloud.google.com/go/vmmigration@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/vmmigration/com_google_cloud_go_vmmigration-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/vmmigration/com_google_cloud_go_vmmigration-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/vmmigration/com_google_cloud_go_vmmigration-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/vmmigration/com_google_cloud_go_vmmigration-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_vmwareengine",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/vmwareengine",
        sha256 = "1819e47ae928ab638a0f9568e6db446a8ef5a7ff61a653b9103d8fa7471344d4",
        strip_prefix = "cloud.google.com/go/vmwareengine@v1.1.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/vmwareengine/com_google_cloud_go_vmwareengine-v1.1.2.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/vmwareengine/com_google_cloud_go_vmwareengine-v1.1.2.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/vmwareengine/com_google_cloud_go_vmwareengine-v1.1.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/vmwareengine/com_google_cloud_go_vmwareengine-v1.1.2.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_vpcaccess",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/vpcaccess",
        sha256 = "6eb319c339a46e400454a2fd2b12f3d0f06b8586bcb2e2f14476121d9f8899bc",
        strip_prefix = "cloud.google.com/go/vpcaccess@v1.7.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/vpcaccess/com_google_cloud_go_vpcaccess-v1.7.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/vpcaccess/com_google_cloud_go_vpcaccess-v1.7.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/vpcaccess/com_google_cloud_go_vpcaccess-v1.7.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/vpcaccess/com_google_cloud_go_vpcaccess-v1.7.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_webrisk",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/webrisk",
        sha256 = "7a860fd7409921f4d3958f1aca986876b9159243baff6d03e33478c39b1c69a0",
        strip_prefix = "cloud.google.com/go/webrisk@v1.9.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/webrisk/com_google_cloud_go_webrisk-v1.9.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/webrisk/com_google_cloud_go_webrisk-v1.9.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/webrisk/com_google_cloud_go_webrisk-v1.9.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/webrisk/com_google_cloud_go_webrisk-v1.9.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_websecurityscanner",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/websecurityscanner",
        sha256 = "30b8ae174a209f185a30ad5d5c273b76610400ed0f8ff2cbf5e880281a094182",
        strip_prefix = "cloud.google.com/go/websecurityscanner@v1.6.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/websecurityscanner/com_google_cloud_go_websecurityscanner-v1.6.6.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/websecurityscanner/com_google_cloud_go_websecurityscanner-v1.6.6.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/websecurityscanner/com_google_cloud_go_websecurityscanner-v1.6.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/websecurityscanner/com_google_cloud_go_websecurityscanner-v1.6.6.zip",
        ],
    )
    go_repository(
        name = "com_google_cloud_go_workflows",
        build_file_proto_mode = "disable_global",
        importpath = "cloud.google.com/go/workflows",
        sha256 = "f0bf18ee4ac63f1ffa00729a9e231a53cb6db3d04d33efa4f1b7986ebcfdddf0",
        strip_prefix = "cloud.google.com/go/workflows@v1.12.5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/cloud.google.com/go/workflows/com_google_cloud_go_workflows-v1.12.5.zip",
            "http://ats.apps.svc/gomod/cloud.google.com/go/workflows/com_google_cloud_go_workflows-v1.12.5.zip",
            "https://cache.hawkingrei.com/gomod/cloud.google.com/go/workflows/com_google_cloud_go_workflows-v1.12.5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/cloud.google.com/go/workflows/com_google_cloud_go_workflows-v1.12.5.zip",
        ],
    )
    go_repository(
        name = "com_lukechampine_uint128",
        build_file_proto_mode = "disable_global",
        importpath = "lukechampine.com/uint128",
        sha256 = "9ff6e9ad553a69fdb961ab2d92f92cda183ef616a6709c15972c2d4bedf33de5",
        strip_prefix = "lukechampine.com/uint128@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/lukechampine.com/uint128/com_lukechampine_uint128-v1.2.0.zip",
            "http://ats.apps.svc/gomod/lukechampine.com/uint128/com_lukechampine_uint128-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/lukechampine.com/uint128/com_lukechampine_uint128-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/lukechampine.com/uint128/com_lukechampine_uint128-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "com_shuralyov_dmitri_gpu_mtl",
        build_file_proto_mode = "disable_global",
        importpath = "dmitri.shuralyov.com/gpu/mtl",
        sha256 = "ca5330901fcda83d09553ac362576d196c531157bc9c502e76b237cca262b400",
        strip_prefix = "dmitri.shuralyov.com/gpu/mtl@v0.0.0-20190408044501-666a987793e9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/dmitri.shuralyov.com/gpu/mtl/com_shuralyov_dmitri_gpu_mtl-v0.0.0-20190408044501-666a987793e9.zip",
            "http://ats.apps.svc/gomod/dmitri.shuralyov.com/gpu/mtl/com_shuralyov_dmitri_gpu_mtl-v0.0.0-20190408044501-666a987793e9.zip",
            "https://cache.hawkingrei.com/gomod/dmitri.shuralyov.com/gpu/mtl/com_shuralyov_dmitri_gpu_mtl-v0.0.0-20190408044501-666a987793e9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/dmitri.shuralyov.com/gpu/mtl/com_shuralyov_dmitri_gpu_mtl-v0.0.0-20190408044501-666a987793e9.zip",
        ],
    )
    go_repository(
        name = "com_sourcegraph_sourcegraph_appdash",
        build_file_proto_mode = "disable_global",
        importpath = "sourcegraph.com/sourcegraph/appdash",
        sha256 = "c46b442fa40d2af48e08064f4c16ae3712953a9988cd0f7588fcf5e4fc7a2fed",
        strip_prefix = "github.com/sourcegraph/appdash@v0.0.0-20190731080439-ebfcffb1b5c0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sourcegraph/appdash/com_github_sourcegraph_appdash-v0.0.0-20190731080439-ebfcffb1b5c0.zip",
            "http://ats.apps.svc/gomod/github.com/sourcegraph/appdash/com_github_sourcegraph_appdash-v0.0.0-20190731080439-ebfcffb1b5c0.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sourcegraph/appdash/com_github_sourcegraph_appdash-v0.0.0-20190731080439-ebfcffb1b5c0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sourcegraph/appdash/com_github_sourcegraph_appdash-v0.0.0-20190731080439-ebfcffb1b5c0.zip",
        ],
    )
    go_repository(
        name = "com_sourcegraph_sourcegraph_appdash_data",
        build_file_proto_mode = "disable_global",
        importpath = "sourcegraph.com/sourcegraph/appdash-data",
        sha256 = "59b71fa8cdb0fe2b1c02739ccf2daeaf28f2e22c4b178cdc8e1b902ad1022bc0",
        strip_prefix = "github.com/sourcegraph/appdash-data@v0.0.0-20151005221446-73f23eafcf67",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/github.com/sourcegraph/appdash-data/com_github_sourcegraph_appdash_data-v0.0.0-20151005221446-73f23eafcf67.zip",
            "http://ats.apps.svc/gomod/github.com/sourcegraph/appdash-data/com_github_sourcegraph_appdash_data-v0.0.0-20151005221446-73f23eafcf67.zip",
            "https://cache.hawkingrei.com/gomod/github.com/sourcegraph/appdash-data/com_github_sourcegraph_appdash_data-v0.0.0-20151005221446-73f23eafcf67.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/github.com/sourcegraph/appdash-data/com_github_sourcegraph_appdash_data-v0.0.0-20151005221446-73f23eafcf67.zip",
        ],
    )
    go_repository(
        name = "com_stathat_c_consistent",
        build_file_proto_mode = "disable_global",
        importpath = "stathat.com/c/consistent",
        sha256 = "ceb0b3e648f223a897ac3bdd74bd1a0b98c770e9230c3c6ee30838c1d06f6b51",
        strip_prefix = "stathat.com/c/consistent@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/stathat.com/c/consistent/com_stathat_c_consistent-v1.0.0.zip",
            "http://ats.apps.svc/gomod/stathat.com/c/consistent/com_stathat_c_consistent-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/stathat.com/c/consistent/com_stathat_c_consistent-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/stathat.com/c/consistent/com_stathat_c_consistent-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "ht_sr_git_~sbinet_gg",
        build_file_proto_mode = "disable_global",
        importpath = "git.sr.ht/~sbinet/gg",
        sha256 = "435103529c4f24aecf7e4550bc816db2482dda4ee0123d337daba99971a8c498",
        strip_prefix = "git.sr.ht/~sbinet/gg@v0.3.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/git.sr.ht/~sbinet/gg/ht_sr_git_~sbinet_gg-v0.3.1.zip",
            "http://ats.apps.svc/gomod/git.sr.ht/~sbinet/gg/ht_sr_git_~sbinet_gg-v0.3.1.zip",
            "https://cache.hawkingrei.com/gomod/git.sr.ht/~sbinet/gg/ht_sr_git_~sbinet_gg-v0.3.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/git.sr.ht/~sbinet/gg/ht_sr_git_~sbinet_gg-v0.3.1.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_check_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/check.v1",
        sha256 = "f555684e5c5dacc2850dddb345fef1b8f93f546b72685589789da6d2b062710e",
        strip_prefix = "gopkg.in/check.v1@v1.0.0-20201130134442-10cb98267c6c",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/check.v1/in_gopkg_check_v1-v1.0.0-20201130134442-10cb98267c6c.zip",
            "http://ats.apps.svc/gomod/gopkg.in/check.v1/in_gopkg_check_v1-v1.0.0-20201130134442-10cb98267c6c.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/check.v1/in_gopkg_check_v1-v1.0.0-20201130134442-10cb98267c6c.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/check.v1/in_gopkg_check_v1-v1.0.0-20201130134442-10cb98267c6c.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_errgo_v2",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/errgo.v2",
        sha256 = "6b8954819a20ec52982a206fd3eb94629ff53c5790aa77534e6d8daf7de01bee",
        strip_prefix = "gopkg.in/errgo.v2@v2.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/errgo.v2/in_gopkg_errgo_v2-v2.1.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/errgo.v2/in_gopkg_errgo_v2-v2.1.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/errgo.v2/in_gopkg_errgo_v2-v2.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/errgo.v2/in_gopkg_errgo_v2-v2.1.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_inf_v0",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/inf.v0",
        sha256 = "08abac18c95cc43b725d4925f63309398d618beab68b4669659b61255e5374a0",
        strip_prefix = "gopkg.in/inf.v0@v0.9.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/inf.v0/in_gopkg_inf_v0-v0.9.1.zip",
            "http://ats.apps.svc/gomod/gopkg.in/inf.v0/in_gopkg_inf_v0-v0.9.1.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/inf.v0/in_gopkg_inf_v0-v0.9.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/inf.v0/in_gopkg_inf_v0-v0.9.1.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_ini_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/ini.v1",
        sha256 = "bd845dfc762a87a56e5a32a07770dc83e86976db7705d7f89c5dbafdc60b06c6",
        strip_prefix = "gopkg.in/ini.v1@v1.67.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/ini.v1/in_gopkg_ini_v1-v1.67.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/ini.v1/in_gopkg_ini_v1-v1.67.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/ini.v1/in_gopkg_ini_v1-v1.67.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/ini.v1/in_gopkg_ini_v1-v1.67.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_jcmturner_aescts_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/jcmturner/aescts.v1",
        sha256 = "8bfd83c7204032fb16946202d5d643bd9a7e618005bd39578f29030a7d51dcf9",
        strip_prefix = "gopkg.in/jcmturner/aescts.v1@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/jcmturner/aescts.v1/in_gopkg_jcmturner_aescts_v1-v1.0.1.zip",
            "http://ats.apps.svc/gomod/gopkg.in/jcmturner/aescts.v1/in_gopkg_jcmturner_aescts_v1-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/jcmturner/aescts.v1/in_gopkg_jcmturner_aescts_v1-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/jcmturner/aescts.v1/in_gopkg_jcmturner_aescts_v1-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_jcmturner_dnsutils_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/jcmturner/dnsutils.v1",
        sha256 = "4fb8b6a5471cb6dda1d0aabd1e01e4d54cb5ee83c395849916392b19153f5203",
        strip_prefix = "gopkg.in/jcmturner/dnsutils.v1@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/jcmturner/dnsutils.v1/in_gopkg_jcmturner_dnsutils_v1-v1.0.1.zip",
            "http://ats.apps.svc/gomod/gopkg.in/jcmturner/dnsutils.v1/in_gopkg_jcmturner_dnsutils_v1-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/jcmturner/dnsutils.v1/in_gopkg_jcmturner_dnsutils_v1-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/jcmturner/dnsutils.v1/in_gopkg_jcmturner_dnsutils_v1-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_jcmturner_goidentity_v3",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/jcmturner/goidentity.v3",
        sha256 = "1be44bee93d9080ce89f40827c57e8a396b7c801e2d19a1f5446a4325afa755e",
        strip_prefix = "gopkg.in/jcmturner/goidentity.v3@v3.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/jcmturner/goidentity.v3/in_gopkg_jcmturner_goidentity_v3-v3.0.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/jcmturner/goidentity.v3/in_gopkg_jcmturner_goidentity_v3-v3.0.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/jcmturner/goidentity.v3/in_gopkg_jcmturner_goidentity_v3-v3.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/jcmturner/goidentity.v3/in_gopkg_jcmturner_goidentity_v3-v3.0.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_jcmturner_gokrb5_v7",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/jcmturner/gokrb5.v7",
        sha256 = "f7e772eaadb923044924cb86b7a6ed34a3386df831705bb62b6a47dc0819a94b",
        strip_prefix = "gopkg.in/jcmturner/gokrb5.v7@v7.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/jcmturner/gokrb5.v7/in_gopkg_jcmturner_gokrb5_v7-v7.3.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/jcmturner/gokrb5.v7/in_gopkg_jcmturner_gokrb5_v7-v7.3.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/jcmturner/gokrb5.v7/in_gopkg_jcmturner_gokrb5_v7-v7.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/jcmturner/gokrb5.v7/in_gopkg_jcmturner_gokrb5_v7-v7.3.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_jcmturner_rpc_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/jcmturner/rpc.v1",
        sha256 = "83d897b60ecb5a66d25232b775ed04c182ca8e02431f351b3768d4d2876d07ae",
        strip_prefix = "gopkg.in/jcmturner/rpc.v1@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/jcmturner/rpc.v1/in_gopkg_jcmturner_rpc_v1-v1.1.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/jcmturner/rpc.v1/in_gopkg_jcmturner_rpc_v1-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/jcmturner/rpc.v1/in_gopkg_jcmturner_rpc_v1-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/jcmturner/rpc.v1/in_gopkg_jcmturner_rpc_v1-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_mgo_v2",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/mgo.v2",
        sha256 = "86c056ac7d51d59bb158bb740e774c0f80b28c8ce8db56d619a569aa96b2cd03",
        strip_prefix = "gopkg.in/mgo.v2@v2.0.0-20180705113604-9856a29383ce",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/mgo.v2/in_gopkg_mgo_v2-v2.0.0-20180705113604-9856a29383ce.zip",
            "http://ats.apps.svc/gomod/gopkg.in/mgo.v2/in_gopkg_mgo_v2-v2.0.0-20180705113604-9856a29383ce.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/mgo.v2/in_gopkg_mgo_v2-v2.0.0-20180705113604-9856a29383ce.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/mgo.v2/in_gopkg_mgo_v2-v2.0.0-20180705113604-9856a29383ce.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_natefinch_lumberjack_v2",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/natefinch/lumberjack.v2",
        sha256 = "e28804b050e7debf4f5b2dd8d241d804f5d592d0519b6e7a3dc9d4cce6f075b3",
        strip_prefix = "gopkg.in/natefinch/lumberjack.v2@v2.2.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/natefinch/lumberjack.v2/in_gopkg_natefinch_lumberjack_v2-v2.2.1.zip",
            "http://ats.apps.svc/gomod/gopkg.in/natefinch/lumberjack.v2/in_gopkg_natefinch_lumberjack_v2-v2.2.1.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/natefinch/lumberjack.v2/in_gopkg_natefinch_lumberjack_v2-v2.2.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/natefinch/lumberjack.v2/in_gopkg_natefinch_lumberjack_v2-v2.2.1.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_tomb_v1",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/tomb.v1",
        sha256 = "34898dc0e38ba7a792ab74a3e0fa113116313fd9142ffb444b011fd392762186",
        strip_prefix = "gopkg.in/tomb.v1@v1.0.0-20141024135613-dd632973f1e7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/tomb.v1/in_gopkg_tomb_v1-v1.0.0-20141024135613-dd632973f1e7.zip",
            "http://ats.apps.svc/gomod/gopkg.in/tomb.v1/in_gopkg_tomb_v1-v1.0.0-20141024135613-dd632973f1e7.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/tomb.v1/in_gopkg_tomb_v1-v1.0.0-20141024135613-dd632973f1e7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/tomb.v1/in_gopkg_tomb_v1-v1.0.0-20141024135613-dd632973f1e7.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_yaml_v2",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/yaml.v2",
        sha256 = "ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd",
        strip_prefix = "gopkg.in/yaml.v2@v2.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/yaml.v2/in_gopkg_yaml_v2-v2.4.0.zip",
            "http://ats.apps.svc/gomod/gopkg.in/yaml.v2/in_gopkg_yaml_v2-v2.4.0.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/yaml.v2/in_gopkg_yaml_v2-v2.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/yaml.v2/in_gopkg_yaml_v2-v2.4.0.zip",
        ],
    )
    go_repository(
        name = "in_gopkg_yaml_v3",
        build_file_proto_mode = "disable_global",
        importpath = "gopkg.in/yaml.v3",
        sha256 = "aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015",
        strip_prefix = "gopkg.in/yaml.v3@v3.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gopkg.in/yaml.v3/in_gopkg_yaml_v3-v3.0.1.zip",
            "http://ats.apps.svc/gomod/gopkg.in/yaml.v3/in_gopkg_yaml_v3-v3.0.1.zip",
            "https://cache.hawkingrei.com/gomod/gopkg.in/yaml.v3/in_gopkg_yaml_v3-v3.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gopkg.in/yaml.v3/in_gopkg_yaml_v3-v3.0.1.zip",
        ],
    )
    go_repository(
        name = "info_augendre_go_arangolint",
        build_file_proto_mode = "disable_global",
        importpath = "go.augendre.info/arangolint",
        sha256 = "11c51fe15e689bb05e9e91dbf6a01deba6e7b734f467f2a14e7126766e64470d",
        strip_prefix = "go.augendre.info/arangolint@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.augendre.info/arangolint/info_augendre_go_arangolint-v0.2.0.zip",
            "http://ats.apps.svc/gomod/go.augendre.info/arangolint/info_augendre_go_arangolint-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/go.augendre.info/arangolint/info_augendre_go_arangolint-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.augendre.info/arangolint/info_augendre_go_arangolint-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "info_augendre_go_fatcontext",
        build_file_proto_mode = "disable_global",
        importpath = "go.augendre.info/fatcontext",
        sha256 = "e029667b1eda72a0ca92e3374589228216fa67bd1ee291d7efaa459b2563d4d6",
        strip_prefix = "go.augendre.info/fatcontext@v0.8.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.augendre.info/fatcontext/info_augendre_go_fatcontext-v0.8.0.zip",
            "http://ats.apps.svc/gomod/go.augendre.info/fatcontext/info_augendre_go_fatcontext-v0.8.0.zip",
            "https://cache.hawkingrei.com/gomod/go.augendre.info/fatcontext/info_augendre_go_fatcontext-v0.8.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.augendre.info/fatcontext/info_augendre_go_fatcontext-v0.8.0.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_bbolt",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/bbolt",
        sha256 = "ede5613b5c996a912a75032463a696e3be4220ff7e150e66c8464f7f2510fe2f",
        strip_prefix = "go.etcd.io/bbolt@v1.3.10",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/bbolt/io_etcd_go_bbolt-v1.3.10.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/bbolt/io_etcd_go_bbolt-v1.3.10.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/bbolt/io_etcd_go_bbolt-v1.3.10.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/bbolt/io_etcd_go_bbolt-v1.3.10.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_api_v3",
        build_file_proto_mode = "disable",
        importpath = "go.etcd.io/etcd/api/v3",
        sha256 = "a225edc5039a792457aa06740181e4427f6a3353002eedf0f412712b6edfe465",
        strip_prefix = "go.etcd.io/etcd/api/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/api/v3/io_etcd_go_etcd_api_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/api/v3/io_etcd_go_etcd_api_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/api/v3/io_etcd_go_etcd_api_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/api/v3/io_etcd_go_etcd_api_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_client_pkg_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/client/pkg/v3",
        sha256 = "ce5c5b019c5336aaac4b9350aea429c08db4197f8ff311ad882d676c9b50c3ad",
        strip_prefix = "go.etcd.io/etcd/client/pkg/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/client/pkg/v3/io_etcd_go_etcd_client_pkg_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/client/pkg/v3/io_etcd_go_etcd_client_pkg_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/client/pkg/v3/io_etcd_go_etcd_client_pkg_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/client/pkg/v3/io_etcd_go_etcd_client_pkg_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_client_v2",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/client/v2",
        sha256 = "c8d2c156533a1a2dd251b8d7471a39b3e6f9b25a659d0d6620fb8c7aea0688c2",
        strip_prefix = "go.etcd.io/etcd/client/v2@v2.305.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/client/v2/io_etcd_go_etcd_client_v2-v2.305.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/client/v2/io_etcd_go_etcd_client_v2-v2.305.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/client/v2/io_etcd_go_etcd_client_v2-v2.305.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/client/v2/io_etcd_go_etcd_client_v2-v2.305.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_client_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/client/v3",
        sha256 = "15b76c8378b4faca4594144e1657e0ec4c09802c150eb9ac0d4a89d1aceee75e",
        strip_prefix = "go.etcd.io/etcd/client/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/client/v3/io_etcd_go_etcd_client_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/client/v3/io_etcd_go_etcd_client_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/client/v3/io_etcd_go_etcd_client_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/client/v3/io_etcd_go_etcd_client_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_etcdutl_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/etcdutl/v3",
        sha256 = "99bd26e0e5c358037f265f39c39642eaf21f4805d99dce3f88ba0b8e4c870d66",
        strip_prefix = "go.etcd.io/etcd/etcdutl/v3@v3.5.12",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/etcdutl/v3/io_etcd_go_etcd_etcdutl_v3-v3.5.12.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/etcdutl/v3/io_etcd_go_etcd_etcdutl_v3-v3.5.12.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/etcdutl/v3/io_etcd_go_etcd_etcdutl_v3-v3.5.12.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/etcdutl/v3/io_etcd_go_etcd_etcdutl_v3-v3.5.12.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_pkg_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/pkg/v3",
        sha256 = "15ac7f1a974644dcc2baa2dd0cfb4eac23d6f11fe36e5484d432d9c504655718",
        strip_prefix = "go.etcd.io/etcd/pkg/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/pkg/v3/io_etcd_go_etcd_pkg_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/pkg/v3/io_etcd_go_etcd_pkg_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/pkg/v3/io_etcd_go_etcd_pkg_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/pkg/v3/io_etcd_go_etcd_pkg_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_raft_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/raft/v3",
        sha256 = "6fed298c9dbcaca9fa63633356806c78f6b3ee0223910e08fefd93a787f0e7e9",
        strip_prefix = "go.etcd.io/etcd/raft/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/raft/v3/io_etcd_go_etcd_raft_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/raft/v3/io_etcd_go_etcd_raft_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/raft/v3/io_etcd_go_etcd_raft_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/raft/v3/io_etcd_go_etcd_raft_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_server_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/server/v3",
        sha256 = "e8bf75eaca0895b6f275d8d6b22016e2d128de57da21d74fa11933f022d0fb30",
        strip_prefix = "go.etcd.io/etcd/server/v3@v3.5.15",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/server/v3/io_etcd_go_etcd_server_v3-v3.5.15.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/server/v3/io_etcd_go_etcd_server_v3-v3.5.15.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/server/v3/io_etcd_go_etcd_server_v3-v3.5.15.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/server/v3/io_etcd_go_etcd_server_v3-v3.5.15.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_etcd_tests_v3",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/etcd/tests/v3",
        sha256 = "c9bb64b9ac82d2e9f7630632259065e16c40ea6bffe2c4be0e695154def88a04",
        strip_prefix = "go.etcd.io/etcd/tests/v3@v3.5.12",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/etcd/tests/v3/io_etcd_go_etcd_tests_v3-v3.5.12.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/etcd/tests/v3/io_etcd_go_etcd_tests_v3-v3.5.12.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/etcd/tests/v3/io_etcd_go_etcd_tests_v3-v3.5.12.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/etcd/tests/v3/io_etcd_go_etcd_tests_v3-v3.5.12.zip",
        ],
    )
    go_repository(
        name = "io_etcd_go_gofail",
        build_file_proto_mode = "disable_global",
        importpath = "go.etcd.io/gofail",
        sha256 = "4fd6977dd736aba56be58c0b16e96d73433688976a5b352578d3c54d0db9e803",
        strip_prefix = "go.etcd.io/gofail@v0.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.etcd.io/gofail/io_etcd_go_gofail-v0.1.0.zip",
            "http://ats.apps.svc/gomod/go.etcd.io/gofail/io_etcd_go_gofail-v0.1.0.zip",
            "https://cache.hawkingrei.com/gomod/go.etcd.io/gofail/io_etcd_go_gofail-v0.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.etcd.io/gofail/io_etcd_go_gofail-v0.1.0.zip",
        ],
    )
    go_repository(
        name = "io_filippo_edwards25519",
        build_file_proto_mode = "disable_global",
        importpath = "filippo.io/edwards25519",
        sha256 = "9ac43a686d06fdebd719f7af3866c87eb069302272dfb131007adf471c308b65",
        strip_prefix = "filippo.io/edwards25519@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/filippo.io/edwards25519/io_filippo_edwards25519-v1.1.0.zip",
            "http://ats.apps.svc/gomod/filippo.io/edwards25519/io_filippo_edwards25519-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/filippo.io/edwards25519/io_filippo_edwards25519-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/filippo.io/edwards25519/io_filippo_edwards25519-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "io_gorm_driver_mysql",
        build_file_proto_mode = "disable_global",
        importpath = "gorm.io/driver/mysql",
        sha256 = "4a529d09c3a0082e313ed76f4d3fe5bfb2667711ef36d7ac6e6804dba43e7978",
        strip_prefix = "gorm.io/driver/mysql@v1.5.7",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gorm.io/driver/mysql/io_gorm_driver_mysql-v1.5.7.zip",
            "http://ats.apps.svc/gomod/gorm.io/driver/mysql/io_gorm_driver_mysql-v1.5.7.zip",
            "https://cache.hawkingrei.com/gomod/gorm.io/driver/mysql/io_gorm_driver_mysql-v1.5.7.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gorm.io/driver/mysql/io_gorm_driver_mysql-v1.5.7.zip",
        ],
    )
    go_repository(
        name = "io_gorm_gorm",
        build_file_proto_mode = "disable_global",
        importpath = "gorm.io/gorm",
        sha256 = "74f4fae208a8a5622612f6f3cadd01c8122074be1dd652017ddf4aa1f22c7351",
        strip_prefix = "gorm.io/gorm@v1.25.12",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gorm.io/gorm/io_gorm_gorm-v1.25.12.zip",
            "http://ats.apps.svc/gomod/gorm.io/gorm/io_gorm_gorm-v1.25.12.zip",
            "https://cache.hawkingrei.com/gomod/gorm.io/gorm/io_gorm_gorm-v1.25.12.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gorm.io/gorm/io_gorm_gorm-v1.25.12.zip",
        ],
    )
    go_repository(
        name = "io_k8s_api",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/api",
        sha256 = "ae7b519f36431bc55fa56c47a51c1c37cf9e0df7e9d23741b3e839426d2627ff",
        strip_prefix = "k8s.io/api@v0.29.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/api/io_k8s_api-v0.29.11.zip",
            "http://ats.apps.svc/gomod/k8s.io/api/io_k8s_api-v0.29.11.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/api/io_k8s_api-v0.29.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/api/io_k8s_api-v0.29.11.zip",
        ],
    )
    go_repository(
        name = "io_k8s_apimachinery",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/apimachinery",
        sha256 = "8dd5f53bf72f7bd6323bcc8f9f45823b30fc350daee4ab2d9e27cf1960d06b25",
        strip_prefix = "k8s.io/apimachinery@v0.29.11",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/apimachinery/io_k8s_apimachinery-v0.29.11.zip",
            "http://ats.apps.svc/gomod/k8s.io/apimachinery/io_k8s_apimachinery-v0.29.11.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/apimachinery/io_k8s_apimachinery-v0.29.11.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/apimachinery/io_k8s_apimachinery-v0.29.11.zip",
        ],
    )
    go_repository(
        name = "io_k8s_client_go",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/client-go",
        sha256 = "d7ba046e2a7574042492b9986943f782e48284fffbd4e86405b5ae011da37bf3",
        strip_prefix = "k8s.io/client-go@v0.28.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/client-go/io_k8s_client_go-v0.28.6.zip",
            "http://ats.apps.svc/gomod/k8s.io/client-go/io_k8s_client_go-v0.28.6.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/client-go/io_k8s_client_go-v0.28.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/client-go/io_k8s_client_go-v0.28.6.zip",
        ],
    )
    go_repository(
        name = "io_k8s_klog",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/klog",
        sha256 = "a564b06078ddf014c5b793a7d36643d6fda31fc131e36b95cdea94ff838b99be",
        strip_prefix = "k8s.io/klog@v1.0.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/klog/io_k8s_klog-v1.0.0.zip",
            "http://ats.apps.svc/gomod/k8s.io/klog/io_k8s_klog-v1.0.0.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/klog/io_k8s_klog-v1.0.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/klog/io_k8s_klog-v1.0.0.zip",
        ],
    )
    go_repository(
        name = "io_k8s_klog_v2",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/klog/v2",
        sha256 = "f6793076147daa5aefcc1ef0f5536c063dd8e209af9f95f8fed4efbd57665a49",
        strip_prefix = "k8s.io/klog/v2@v2.120.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/klog/v2/io_k8s_klog_v2-v2.120.1.zip",
            "http://ats.apps.svc/gomod/k8s.io/klog/v2/io_k8s_klog_v2-v2.120.1.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/klog/v2/io_k8s_klog_v2-v2.120.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/klog/v2/io_k8s_klog_v2-v2.120.1.zip",
        ],
    )
    go_repository(
        name = "io_k8s_kube_openapi",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/kube-openapi",
        sha256 = "57cb5b3e2bdcb29c209e7b543bc61f4f8d7dd390fc21a883a7c0f388771931b2",
        strip_prefix = "k8s.io/kube-openapi@v0.0.0-20231010175941-2dd684a91f00",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/kube-openapi/io_k8s_kube_openapi-v0.0.0-20231010175941-2dd684a91f00.zip",
            "http://ats.apps.svc/gomod/k8s.io/kube-openapi/io_k8s_kube_openapi-v0.0.0-20231010175941-2dd684a91f00.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/kube-openapi/io_k8s_kube_openapi-v0.0.0-20231010175941-2dd684a91f00.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/kube-openapi/io_k8s_kube_openapi-v0.0.0-20231010175941-2dd684a91f00.zip",
        ],
    )
    go_repository(
        name = "io_k8s_sigs_json",
        build_file_proto_mode = "disable_global",
        importpath = "sigs.k8s.io/json",
        sha256 = "ddcc6a7c6c22b9b370c270bfefb4b68f424bf740aa18cb766f104531de6e0e6e",
        strip_prefix = "sigs.k8s.io/json@v0.0.0-20221116044647-bc3834ca7abd",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/sigs.k8s.io/json/io_k8s_sigs_json-v0.0.0-20221116044647-bc3834ca7abd.zip",
            "http://ats.apps.svc/gomod/sigs.k8s.io/json/io_k8s_sigs_json-v0.0.0-20221116044647-bc3834ca7abd.zip",
            "https://cache.hawkingrei.com/gomod/sigs.k8s.io/json/io_k8s_sigs_json-v0.0.0-20221116044647-bc3834ca7abd.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/sigs.k8s.io/json/io_k8s_sigs_json-v0.0.0-20221116044647-bc3834ca7abd.zip",
        ],
    )
    go_repository(
        name = "io_k8s_sigs_structured_merge_diff_v4",
        build_file_proto_mode = "disable_global",
        importpath = "sigs.k8s.io/structured-merge-diff/v4",
        sha256 = "ce80f7bbeca9f900e8ec311744007cd764c679ecc8d3a6aaa6abf1223dde91f2",
        strip_prefix = "sigs.k8s.io/structured-merge-diff/v4@v4.4.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/sigs.k8s.io/structured-merge-diff/v4/io_k8s_sigs_structured_merge_diff_v4-v4.4.1.zip",
            "http://ats.apps.svc/gomod/sigs.k8s.io/structured-merge-diff/v4/io_k8s_sigs_structured_merge_diff_v4-v4.4.1.zip",
            "https://cache.hawkingrei.com/gomod/sigs.k8s.io/structured-merge-diff/v4/io_k8s_sigs_structured_merge_diff_v4-v4.4.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/sigs.k8s.io/structured-merge-diff/v4/io_k8s_sigs_structured_merge_diff_v4-v4.4.1.zip",
        ],
    )
    go_repository(
        name = "io_k8s_sigs_yaml",
        build_file_proto_mode = "disable_global",
        importpath = "sigs.k8s.io/yaml",
        sha256 = "ef031ff78ff9b7036e174eef49dfbd77468dc4f0afb73a639b61f8ab3a1cc425",
        strip_prefix = "sigs.k8s.io/yaml@v1.4.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/sigs.k8s.io/yaml/io_k8s_sigs_yaml-v1.4.0.zip",
            "http://ats.apps.svc/gomod/sigs.k8s.io/yaml/io_k8s_sigs_yaml-v1.4.0.zip",
            "https://cache.hawkingrei.com/gomod/sigs.k8s.io/yaml/io_k8s_sigs_yaml-v1.4.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/sigs.k8s.io/yaml/io_k8s_sigs_yaml-v1.4.0.zip",
        ],
    )
    go_repository(
        name = "io_k8s_utils",
        build_file_proto_mode = "disable_global",
        importpath = "k8s.io/utils",
        sha256 = "b215ab848276200af441edc56a920338d00299cf69005e94bdbe9df76c7bd0ba",
        strip_prefix = "k8s.io/utils@v0.0.0-20230726121419-3b25d923346b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/k8s.io/utils/io_k8s_utils-v0.0.0-20230726121419-3b25d923346b.zip",
            "http://ats.apps.svc/gomod/k8s.io/utils/io_k8s_utils-v0.0.0-20230726121419-3b25d923346b.zip",
            "https://cache.hawkingrei.com/gomod/k8s.io/utils/io_k8s_utils-v0.0.0-20230726121419-3b25d923346b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/k8s.io/utils/io_k8s_utils-v0.0.0-20230726121419-3b25d923346b.zip",
        ],
    )
    go_repository(
        name = "io_opencensus_go",
        build_file_proto_mode = "disable_global",
        importpath = "go.opencensus.io",
        sha256 = "203a767d7f8e7c1ebe5588220ad168d1e15b14ae70a636de7ca9a4a88a7e0d0c",
        strip_prefix = "go.opencensus.io@v0.24.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opencensus.io/io_opencensus_go-v0.24.0.zip",
            "http://ats.apps.svc/gomod/go.opencensus.io/io_opencensus_go-v0.24.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opencensus.io/io_opencensus_go-v0.24.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opencensus.io/io_opencensus_go-v0.24.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_collector_featuregate",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/collector/featuregate",
        sha256 = "b8f74a6e4e4e68dc630b54917755c1604525ce161b9f8a2730079fa19bc11676",
        strip_prefix = "go.opentelemetry.io/collector/featuregate@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/collector/featuregate/io_opentelemetry_go_collector_featuregate-v1.0.1.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/collector/featuregate/io_opentelemetry_go_collector_featuregate-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/collector/featuregate/io_opentelemetry_go_collector_featuregate-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/collector/featuregate/io_opentelemetry_go_collector_featuregate-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_collector_pdata",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/collector/pdata",
        sha256 = "696f8737e0dd15c76a683c7ab00f373a50a4c1f27890ed288ffc994b1bb19d15",
        strip_prefix = "go.opentelemetry.io/collector/pdata@v1.0.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/collector/pdata/io_opentelemetry_go_collector_pdata-v1.0.1.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/collector/pdata/io_opentelemetry_go_collector_pdata-v1.0.1.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/collector/pdata/io_opentelemetry_go_collector_pdata-v1.0.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/collector/pdata/io_opentelemetry_go_collector_pdata-v1.0.1.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_collector_semconv",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/collector/semconv",
        sha256 = "7ee5e8d4b9f9bbdefdec35bc49866ab628ca740344a8940d33874868debfb034",
        strip_prefix = "go.opentelemetry.io/collector/semconv@v0.93.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/collector/semconv/io_opentelemetry_go_collector_semconv-v0.93.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/collector/semconv/io_opentelemetry_go_collector_semconv-v0.93.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/collector/semconv/io_opentelemetry_go_collector_semconv-v0.93.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/collector/semconv/io_opentelemetry_go_collector_semconv-v0.93.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_contrib_instrumentation_google_golang_org_grpc_otelgrpc",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc",
        sha256 = "db8eab928fe25f92268029064d194bd4c1f72d0bf69635c35709ebfbf66b2a55",
        strip_prefix = "go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc@v0.49.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc/io_opentelemetry_go_contrib_instrumentation_google_golang_org_grpc_otelgrpc-v0.49.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc/io_opentelemetry_go_contrib_instrumentation_google_golang_org_grpc_otelgrpc-v0.49.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc/io_opentelemetry_go_contrib_instrumentation_google_golang_org_grpc_otelgrpc-v0.49.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc/io_opentelemetry_go_contrib_instrumentation_google_golang_org_grpc_otelgrpc-v0.49.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_contrib_instrumentation_net_http_otelhttp",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp",
        sha256 = "205c8117aebdc6f6ebab7fbb946d260933716c68a1b2dda8d43ab142b6622b14",
        strip_prefix = "go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp@v0.49.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/io_opentelemetry_go_contrib_instrumentation_net_http_otelhttp-v0.49.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/io_opentelemetry_go_contrib_instrumentation_net_http_otelhttp-v0.49.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/io_opentelemetry_go_contrib_instrumentation_net_http_otelhttp-v0.49.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/io_opentelemetry_go_contrib_instrumentation_net_http_otelhttp-v0.49.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel",
        sha256 = "4aebfe22b33a77bfab346224c3cd0d2da6cb8992318b104f33e9bf5e533effa5",
        strip_prefix = "go.opentelemetry.io/otel@v1.24.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/io_opentelemetry_go_otel-v1.24.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/io_opentelemetry_go_otel-v1.24.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/io_opentelemetry_go_otel-v1.24.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/io_opentelemetry_go_otel-v1.24.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_exporters_otlp_otlptrace",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/exporters/otlp/otlptrace",
        sha256 = "540b6c364dff64897449227b430ce47e2c91dd1d42a09a73c2b8af51598870c8",
        strip_prefix = "go.opentelemetry.io/otel/exporters/otlp/otlptrace@v1.22.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/io_opentelemetry_go_otel_exporters_otlp_otlptrace-v1.22.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/io_opentelemetry_go_otel_exporters_otlp_otlptrace-v1.22.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/io_opentelemetry_go_otel_exporters_otlp_otlptrace-v1.22.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/io_opentelemetry_go_otel_exporters_otlp_otlptrace-v1.22.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracegrpc",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc",
        sha256 = "bdd672c9e7fd5fd7075dab3671242301495eac85352dc0f725b325d988e4084f",
        strip_prefix = "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc@v1.22.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracegrpc-v1.22.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracegrpc-v1.22.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracegrpc-v1.22.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracegrpc-v1.22.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracehttp",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp",
        sha256 = "6b7c01ca38a5b1c4216adcf54c422e0a78c257d918e89b8dd02721c6098b9dec",
        strip_prefix = "go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp@v1.22.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracehttp-v1.22.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracehttp-v1.22.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracehttp-v1.22.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp/io_opentelemetry_go_otel_exporters_otlp_otlptrace_otlptracehttp-v1.22.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_metric",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/metric",
        sha256 = "bbe9ee9443b924d0a9f58a9e2a4a7b1c1ab1274f7d41d0db2a243d9c33eca93c",
        strip_prefix = "go.opentelemetry.io/otel/metric@v1.24.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/metric/io_opentelemetry_go_otel_metric-v1.24.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/metric/io_opentelemetry_go_otel_metric-v1.24.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/metric/io_opentelemetry_go_otel_metric-v1.24.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/metric/io_opentelemetry_go_otel_metric-v1.24.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_sdk",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/sdk",
        sha256 = "60b78206b3b5d44c3f9069ac24e87f90e5474b52bbbbf5a0f454cc7e5f5f409a",
        strip_prefix = "go.opentelemetry.io/otel/sdk@v1.24.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/sdk/io_opentelemetry_go_otel_sdk-v1.24.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/sdk/io_opentelemetry_go_otel_sdk-v1.24.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/sdk/io_opentelemetry_go_otel_sdk-v1.24.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/sdk/io_opentelemetry_go_otel_sdk-v1.24.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_otel_trace",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/otel/trace",
        sha256 = "4d561c375a78a5404d154add753f9ee24b30307a233d346bdecdb4adb83ff408",
        strip_prefix = "go.opentelemetry.io/otel/trace@v1.24.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/otel/trace/io_opentelemetry_go_otel_trace-v1.24.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/otel/trace/io_opentelemetry_go_otel_trace-v1.24.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/otel/trace/io_opentelemetry_go_otel_trace-v1.24.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/otel/trace/io_opentelemetry_go_otel_trace-v1.24.0.zip",
        ],
    )
    go_repository(
        name = "io_opentelemetry_go_proto_otlp",
        build_file_proto_mode = "disable_global",
        importpath = "go.opentelemetry.io/proto/otlp",
        sha256 = "46e71b2f65b00ee99ac72144caac6eb83a0316a03b736a4e3a76235874783649",
        strip_prefix = "go.opentelemetry.io/proto/otlp@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.opentelemetry.io/proto/otlp/io_opentelemetry_go_proto_otlp-v1.1.0.zip",
            "http://ats.apps.svc/gomod/go.opentelemetry.io/proto/otlp/io_opentelemetry_go_proto_otlp-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/go.opentelemetry.io/proto/otlp/io_opentelemetry_go_proto_otlp-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.opentelemetry.io/proto/otlp/io_opentelemetry_go_proto_otlp-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "io_rsc_binaryregexp",
        build_file_proto_mode = "disable_global",
        importpath = "rsc.io/binaryregexp",
        sha256 = "b3e706aa278fa7f880d32fa1cc40ef8282d1fc7d6e00356579ed0db88f3b0047",
        strip_prefix = "rsc.io/binaryregexp@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/rsc.io/binaryregexp/io_rsc_binaryregexp-v0.2.0.zip",
            "http://ats.apps.svc/gomod/rsc.io/binaryregexp/io_rsc_binaryregexp-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/rsc.io/binaryregexp/io_rsc_binaryregexp-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/rsc.io/binaryregexp/io_rsc_binaryregexp-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "io_rsc_pdf",
        build_file_proto_mode = "disable_global",
        importpath = "rsc.io/pdf",
        sha256 = "79bf310e399cf0e2d8aa61536750d2a6999c5ca884e7a27faf88d3701cd5ba8f",
        strip_prefix = "rsc.io/pdf@v0.1.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/rsc.io/pdf/io_rsc_pdf-v0.1.1.zip",
            "http://ats.apps.svc/gomod/rsc.io/pdf/io_rsc_pdf-v0.1.1.zip",
            "https://cache.hawkingrei.com/gomod/rsc.io/pdf/io_rsc_pdf-v0.1.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/rsc.io/pdf/io_rsc_pdf-v0.1.1.zip",
        ],
    )
    go_repository(
        name = "io_rsc_quote_v3",
        build_file_proto_mode = "disable_global",
        importpath = "rsc.io/quote/v3",
        sha256 = "b434cbbfc32c17b5228d0b0eddeaea89bef4ec9bd90b5c8fc55b64f8ce13eeb9",
        strip_prefix = "rsc.io/quote/v3@v3.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/rsc.io/quote/v3/io_rsc_quote_v3-v3.1.0.zip",
            "http://ats.apps.svc/gomod/rsc.io/quote/v3/io_rsc_quote_v3-v3.1.0.zip",
            "https://cache.hawkingrei.com/gomod/rsc.io/quote/v3/io_rsc_quote_v3-v3.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/rsc.io/quote/v3/io_rsc_quote_v3-v3.1.0.zip",
        ],
    )
    go_repository(
        name = "io_rsc_sampler",
        build_file_proto_mode = "disable_global",
        importpath = "rsc.io/sampler",
        sha256 = "da202b0da803ab2661ab98a680bba4f64123a326e540c25582b6cdbb9dc114aa",
        strip_prefix = "rsc.io/sampler@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/rsc.io/sampler/io_rsc_sampler-v1.3.0.zip",
            "http://ats.apps.svc/gomod/rsc.io/sampler/io_rsc_sampler-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/rsc.io/sampler/io_rsc_sampler-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/rsc.io/sampler/io_rsc_sampler-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "net_starlark_go",
        build_file_proto_mode = "disable_global",
        importpath = "go.starlark.net",
        sha256 = "6f936b11557fe2855ec58245bebfd34260db79d2e4dc63ab58659f3de1dde51c",
        strip_prefix = "go.starlark.net@v0.0.0-20210223155950-e043a3d3c984",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.starlark.net/net_starlark_go-v0.0.0-20210223155950-e043a3d3c984.zip",
            "http://ats.apps.svc/gomod/go.starlark.net/net_starlark_go-v0.0.0-20210223155950-e043a3d3c984.zip",
            "https://cache.hawkingrei.com/gomod/go.starlark.net/net_starlark_go-v0.0.0-20210223155950-e043a3d3c984.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.starlark.net/net_starlark_go-v0.0.0-20210223155950-e043a3d3c984.zip",
        ],
    )
    go_repository(
        name = "org_codeberg_chavacava_garif",
        build_file_proto_mode = "disable_global",
        importpath = "codeberg.org/chavacava/garif",
        sha256 = "c4527d171906e315a81340e19f8b86ae9a9178655033d60d0e81522d7f29d8b8",
        strip_prefix = "codeberg.org/chavacava/garif@v0.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/codeberg.org/chavacava/garif/org_codeberg_chavacava_garif-v0.2.0.zip",
            "http://ats.apps.svc/gomod/codeberg.org/chavacava/garif/org_codeberg_chavacava_garif-v0.2.0.zip",
            "https://cache.hawkingrei.com/gomod/codeberg.org/chavacava/garif/org_codeberg_chavacava_garif-v0.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/codeberg.org/chavacava/garif/org_codeberg_chavacava_garif-v0.2.0.zip",
        ],
    )
    go_repository(
        name = "org_gioui",
        build_file_proto_mode = "disable_global",
        importpath = "gioui.org",
        sha256 = "fcbab2a0ea09ff775c1ff4fa99299d95b94aad496b1ac329e3c7389119168fc0",
        strip_prefix = "gioui.org@v0.0.0-20210308172011-57750fc8a0a6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gioui.org/org_gioui-v0.0.0-20210308172011-57750fc8a0a6.zip",
            "http://ats.apps.svc/gomod/gioui.org/org_gioui-v0.0.0-20210308172011-57750fc8a0a6.zip",
            "https://cache.hawkingrei.com/gomod/gioui.org/org_gioui-v0.0.0-20210308172011-57750fc8a0a6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gioui.org/org_gioui-v0.0.0-20210308172011-57750fc8a0a6.zip",
        ],
    )
    go_repository(
        name = "org_go_simpler_musttag",
        build_file_proto_mode = "disable_global",
        importpath = "go-simpler.org/musttag",
        sha256 = "c2ed77c36196d95215d8f3a863b645e98ec14453981b86bfc7f6dfd7011f39f4",
        strip_prefix = "go-simpler.org/musttag@v0.13.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go-simpler.org/musttag/org_go_simpler_musttag-v0.13.1.zip",
            "http://ats.apps.svc/gomod/go-simpler.org/musttag/org_go_simpler_musttag-v0.13.1.zip",
            "https://cache.hawkingrei.com/gomod/go-simpler.org/musttag/org_go_simpler_musttag-v0.13.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go-simpler.org/musttag/org_go_simpler_musttag-v0.13.1.zip",
        ],
    )
    go_repository(
        name = "org_go_simpler_sloglint",
        build_file_proto_mode = "disable_global",
        importpath = "go-simpler.org/sloglint",
        sha256 = "d5150d18c6503e2327c324313ddbc3f8a607bb100fe274d44e165822095aa920",
        strip_prefix = "go-simpler.org/sloglint@v0.11.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go-simpler.org/sloglint/org_go_simpler_sloglint-v0.11.1.zip",
            "http://ats.apps.svc/gomod/go-simpler.org/sloglint/org_go_simpler_sloglint-v0.11.1.zip",
            "https://cache.hawkingrei.com/gomod/go-simpler.org/sloglint/org_go_simpler_sloglint-v0.11.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go-simpler.org/sloglint/org_go_simpler_sloglint-v0.11.1.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_api",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/api",
        sha256 = "bb1337b6f4ee56bbb7bac672bf52d5904bdfe6d162a552264b5e89643330d566",
        strip_prefix = "google.golang.org/api@v0.170.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/api/org_golang_google_api-v0.170.0.zip",
            "http://ats.apps.svc/gomod/google.golang.org/api/org_golang_google_api-v0.170.0.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/api/org_golang_google_api-v0.170.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/api/org_golang_google_api-v0.170.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_appengine",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/appengine",
        sha256 = "23e40ee378db26bd45b7de851a85ba6c6d340c9dd353f8ba961ebe9e01bf02c6",
        strip_prefix = "google.golang.org/appengine@v1.6.8",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/appengine/org_golang_google_appengine-v1.6.8.zip",
            "http://ats.apps.svc/gomod/google.golang.org/appengine/org_golang_google_appengine-v1.6.8.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/appengine/org_golang_google_appengine-v1.6.8.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/appengine/org_golang_google_appengine-v1.6.8.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_genproto",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto",
        sha256 = "9e02a5cd403a29d32b296c66a0a00bd607cd856c434a7c91f4759c5f2fd89d9c",
        strip_prefix = "google.golang.org/genproto@v0.0.0-20240401170217-c3f982113cda",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/genproto/org_golang_google_genproto-v0.0.0-20240401170217-c3f982113cda.zip",
            "http://ats.apps.svc/gomod/google.golang.org/genproto/org_golang_google_genproto-v0.0.0-20240401170217-c3f982113cda.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/genproto/org_golang_google_genproto-v0.0.0-20240401170217-c3f982113cda.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/genproto/org_golang_google_genproto-v0.0.0-20240401170217-c3f982113cda.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_genproto_googleapis_api",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto/googleapis/api",
        sha256 = "956715d2f83c3ac6ba23c0e85494973c3d66ac375719655864cb5351746856f4",
        strip_prefix = "google.golang.org/genproto/googleapis/api@v0.0.0-20240401170217-c3f982113cda",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/genproto/googleapis/api/org_golang_google_genproto_googleapis_api-v0.0.0-20240401170217-c3f982113cda.zip",
            "http://ats.apps.svc/gomod/google.golang.org/genproto/googleapis/api/org_golang_google_genproto_googleapis_api-v0.0.0-20240401170217-c3f982113cda.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/genproto/googleapis/api/org_golang_google_genproto_googleapis_api-v0.0.0-20240401170217-c3f982113cda.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/genproto/googleapis/api/org_golang_google_genproto_googleapis_api-v0.0.0-20240401170217-c3f982113cda.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_genproto_googleapis_bytestream",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto/googleapis/bytestream",
        sha256 = "ab36a9d9a64c04f92b23000537bf5103173d641bd193610b39e091e3c1a8bd9f",
        strip_prefix = "google.golang.org/genproto/googleapis/bytestream@v0.0.0-20240311132316-a219d84964c2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/genproto/googleapis/bytestream/org_golang_google_genproto_googleapis_bytestream-v0.0.0-20240311132316-a219d84964c2.zip",
            "http://ats.apps.svc/gomod/google.golang.org/genproto/googleapis/bytestream/org_golang_google_genproto_googleapis_bytestream-v0.0.0-20240311132316-a219d84964c2.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/genproto/googleapis/bytestream/org_golang_google_genproto_googleapis_bytestream-v0.0.0-20240311132316-a219d84964c2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/genproto/googleapis/bytestream/org_golang_google_genproto_googleapis_bytestream-v0.0.0-20240311132316-a219d84964c2.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_genproto_googleapis_rpc",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/genproto/googleapis/rpc",
        sha256 = "53ce5ee04a9fd853c81fdd00cd06b426ec3212e57ae6d591153ad823243bae8a",
        strip_prefix = "google.golang.org/genproto/googleapis/rpc@v0.0.0-20240515191416-fc5f0ca64291",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/genproto/googleapis/rpc/org_golang_google_genproto_googleapis_rpc-v0.0.0-20240515191416-fc5f0ca64291.zip",
            "http://ats.apps.svc/gomod/google.golang.org/genproto/googleapis/rpc/org_golang_google_genproto_googleapis_rpc-v0.0.0-20240515191416-fc5f0ca64291.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/genproto/googleapis/rpc/org_golang_google_genproto_googleapis_rpc-v0.0.0-20240515191416-fc5f0ca64291.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/genproto/googleapis/rpc/org_golang_google_genproto_googleapis_rpc-v0.0.0-20240515191416-fc5f0ca64291.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_grpc",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/grpc",
        sha256 = "1d49288986efd05a7b4ac6cee078f84e29e464678c776f25e09efddfba852fd1",
        strip_prefix = "google.golang.org/grpc@v1.63.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/grpc/org_golang_google_grpc-v1.63.2.zip",
            "http://ats.apps.svc/gomod/google.golang.org/grpc/org_golang_google_grpc-v1.63.2.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/grpc/org_golang_google_grpc-v1.63.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/grpc/org_golang_google_grpc-v1.63.2.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_grpc_examples",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/grpc/examples",
        sha256 = "1d6cbdae96a305d977ffa3b101fd89fa9bceb80cead93254d3f85b43faf40e07",
        strip_prefix = "google.golang.org/grpc/examples@v0.0.0-20231221225426-4f03f3ff32c9",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/grpc/examples/org_golang_google_grpc_examples-v0.0.0-20231221225426-4f03f3ff32c9.zip",
            "http://ats.apps.svc/gomod/google.golang.org/grpc/examples/org_golang_google_grpc_examples-v0.0.0-20231221225426-4f03f3ff32c9.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/grpc/examples/org_golang_google_grpc_examples-v0.0.0-20231221225426-4f03f3ff32c9.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/grpc/examples/org_golang_google_grpc_examples-v0.0.0-20231221225426-4f03f3ff32c9.zip",
        ],
    )
    go_repository(
        name = "org_golang_google_protobuf",
        build_file_proto_mode = "disable_global",
        importpath = "google.golang.org/protobuf",
        sha256 = "3294ac8ea5089b3c231351afaea4f012e8027a9beeb523bbf31dcb383cc0ab99",
        strip_prefix = "google.golang.org/protobuf@v1.36.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/google.golang.org/protobuf/org_golang_google_protobuf-v1.36.6.zip",
            "http://ats.apps.svc/gomod/google.golang.org/protobuf/org_golang_google_protobuf-v1.36.6.zip",
            "https://cache.hawkingrei.com/gomod/google.golang.org/protobuf/org_golang_google_protobuf-v1.36.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/google.golang.org/protobuf/org_golang_google_protobuf-v1.36.6.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_crypto",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/crypto",
        sha256 = "6a55423d327359615db923c5f17e5f10c4c7d91c39ef8d0b7f6e0876f89ff9da",
        strip_prefix = "golang.org/x/crypto@v0.40.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/crypto/org_golang_x_crypto-v0.40.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/crypto/org_golang_x_crypto-v0.40.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/crypto/org_golang_x_crypto-v0.40.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/crypto/org_golang_x_crypto-v0.40.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_exp",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/exp",
        sha256 = "447a436882177a2a9fc281116f1858d6e0533c790a90f55cf3a64f1cafb752c6",
        strip_prefix = "golang.org/x/exp@v0.0.0-20240909161429-701f63a606c0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/exp/org_golang_x_exp-v0.0.0-20240909161429-701f63a606c0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/exp/org_golang_x_exp-v0.0.0-20240909161429-701f63a606c0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/exp/org_golang_x_exp-v0.0.0-20240909161429-701f63a606c0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/exp/org_golang_x_exp-v0.0.0-20240909161429-701f63a606c0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_exp_typeparams",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/exp/typeparams",
        sha256 = "eda2631d4f14169153c480fdb332c51ff7f2c355436a1db6ade5223b629ee079",
        strip_prefix = "golang.org/x/exp/typeparams@v0.0.0-20250620022241-b7579e27df2b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/exp/typeparams/org_golang_x_exp_typeparams-v0.0.0-20250620022241-b7579e27df2b.zip",
            "http://ats.apps.svc/gomod/golang.org/x/exp/typeparams/org_golang_x_exp_typeparams-v0.0.0-20250620022241-b7579e27df2b.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/exp/typeparams/org_golang_x_exp_typeparams-v0.0.0-20250620022241-b7579e27df2b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/exp/typeparams/org_golang_x_exp_typeparams-v0.0.0-20250620022241-b7579e27df2b.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_image",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/image",
        sha256 = "56176a4d4d47910d61df9a77aa66a8469ae79fa18b7f5821c43bef1ef212116d",
        strip_prefix = "golang.org/x/image@v0.0.0-20220302094943-723b81ca9867",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/image/org_golang_x_image-v0.0.0-20220302094943-723b81ca9867.zip",
            "http://ats.apps.svc/gomod/golang.org/x/image/org_golang_x_image-v0.0.0-20220302094943-723b81ca9867.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/image/org_golang_x_image-v0.0.0-20220302094943-723b81ca9867.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/image/org_golang_x_image-v0.0.0-20220302094943-723b81ca9867.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_lint",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/lint",
        sha256 = "4620205ccd1fd5c5ced7ccbc264217f407c53924e847f4219e48c04c7480b294",
        strip_prefix = "golang.org/x/lint@v0.0.0-20201208152925-83fdc39ff7b5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/lint/org_golang_x_lint-v0.0.0-20201208152925-83fdc39ff7b5.zip",
            "http://ats.apps.svc/gomod/golang.org/x/lint/org_golang_x_lint-v0.0.0-20201208152925-83fdc39ff7b5.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/lint/org_golang_x_lint-v0.0.0-20201208152925-83fdc39ff7b5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/lint/org_golang_x_lint-v0.0.0-20201208152925-83fdc39ff7b5.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_mobile",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/mobile",
        sha256 = "6b946c7da47acf3b6195336fd071bfc73d543cefab73f2d27528c5dc1dc829ec",
        strip_prefix = "golang.org/x/mobile@v0.0.0-20190719004257-d2bd2a29d028",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/mobile/org_golang_x_mobile-v0.0.0-20190719004257-d2bd2a29d028.zip",
            "http://ats.apps.svc/gomod/golang.org/x/mobile/org_golang_x_mobile-v0.0.0-20190719004257-d2bd2a29d028.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/mobile/org_golang_x_mobile-v0.0.0-20190719004257-d2bd2a29d028.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/mobile/org_golang_x_mobile-v0.0.0-20190719004257-d2bd2a29d028.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_mod",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/mod",
        sha256 = "559ae04b112e304086df0300cf0bee7ce21497c36c088c461d68891b55905605",
        strip_prefix = "golang.org/x/mod@v0.26.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/mod/org_golang_x_mod-v0.26.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/mod/org_golang_x_mod-v0.26.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/mod/org_golang_x_mod-v0.26.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/mod/org_golang_x_mod-v0.26.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_net",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/net",
        sha256 = "cc9f79d1c8a796c756b636cee007b4ac5eba7b1f3276cd42658f4ac4a28cfbc1",
        strip_prefix = "golang.org/x/net@v0.42.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/net/org_golang_x_net-v0.42.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/net/org_golang_x_net-v0.42.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/net/org_golang_x_net-v0.42.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/net/org_golang_x_net-v0.42.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_oauth2",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/oauth2",
        sha256 = "1e1028d0b190948f0cd44229bfa298440cb2481f601f992e12424bc6fa1f183c",
        strip_prefix = "golang.org/x/oauth2@v0.30.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/oauth2/org_golang_x_oauth2-v0.30.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/oauth2/org_golang_x_oauth2-v0.30.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/oauth2/org_golang_x_oauth2-v0.30.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/oauth2/org_golang_x_oauth2-v0.30.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_perf",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/perf",
        sha256 = "bc1b902e645fdd5d210b7db8f3280833af225b131dab5842d7a6d32a676f80f5",
        strip_prefix = "golang.org/x/perf@v0.0.0-20230113213139-801c7ef9e5c5",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/perf/org_golang_x_perf-v0.0.0-20230113213139-801c7ef9e5c5.zip",
            "http://ats.apps.svc/gomod/golang.org/x/perf/org_golang_x_perf-v0.0.0-20230113213139-801c7ef9e5c5.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/perf/org_golang_x_perf-v0.0.0-20230113213139-801c7ef9e5c5.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/perf/org_golang_x_perf-v0.0.0-20230113213139-801c7ef9e5c5.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_sync",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/sync",
        sha256 = "ca43984183eb14f7f50d33da350312fed1c42e106dceac2437bfd5084b497dcd",
        strip_prefix = "golang.org/x/sync@v0.16.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/sync/org_golang_x_sync-v0.16.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/sync/org_golang_x_sync-v0.16.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/sync/org_golang_x_sync-v0.16.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/sync/org_golang_x_sync-v0.16.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_sys",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/sys",
        sha256 = "27d5489227865ffffc3fbbbaf6100952ca2925eba19cfdff01e6e76b986b4bb4",
        strip_prefix = "golang.org/x/sys@v0.34.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/sys/org_golang_x_sys-v0.34.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/sys/org_golang_x_sys-v0.34.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/sys/org_golang_x_sys-v0.34.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/sys/org_golang_x_sys-v0.34.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_telemetry",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/telemetry",
        sha256 = "05ec70dbe6ef46c881f7d7ebe70ff61d9e998d2b4bbdbe6ff968870ef86c67b9",
        strip_prefix = "golang.org/x/telemetry@v0.0.0-20250710130107-8d8967aff50b",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/telemetry/org_golang_x_telemetry-v0.0.0-20250710130107-8d8967aff50b.zip",
            "http://ats.apps.svc/gomod/golang.org/x/telemetry/org_golang_x_telemetry-v0.0.0-20250710130107-8d8967aff50b.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/telemetry/org_golang_x_telemetry-v0.0.0-20250710130107-8d8967aff50b.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/telemetry/org_golang_x_telemetry-v0.0.0-20250710130107-8d8967aff50b.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_term",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/term",
        sha256 = "6165d56707f7b1aef699f762a05eed017502c60ebd486e6a735265fc586d0f07",
        strip_prefix = "golang.org/x/term@v0.33.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/term/org_golang_x_term-v0.33.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/term/org_golang_x_term-v0.33.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/term/org_golang_x_term-v0.33.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/term/org_golang_x_term-v0.33.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_text",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/text",
        sha256 = "1230ce66d74ed4510f1578f25b4e53beee00926dc24c86fab7242637f8415ea8",
        strip_prefix = "golang.org/x/text@v0.27.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/text/org_golang_x_text-v0.27.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/text/org_golang_x_text-v0.27.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/text/org_golang_x_text-v0.27.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/text/org_golang_x_text-v0.27.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_time",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/time",
        sha256 = "cdcb04c43b112919c5e0d0fa1d90769124ad56918a44e6cb0747876ed7e5015c",
        strip_prefix = "golang.org/x/time@v0.12.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/time/org_golang_x_time-v0.12.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/time/org_golang_x_time-v0.12.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/time/org_golang_x_time-v0.12.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/time/org_golang_x_time-v0.12.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_tools",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/tools",
        sha256 = "6d2391d8a9a89e54c79cdeaf5e776dfc079838c90c3ac49e97fd91cf20606e9a",
        strip_prefix = "golang.org/x/tools@v0.35.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/tools/org_golang_x_tools-v0.35.0.zip",
            "http://ats.apps.svc/gomod/golang.org/x/tools/org_golang_x_tools-v0.35.0.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/tools/org_golang_x_tools-v0.35.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/tools/org_golang_x_tools-v0.35.0.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_tools_go_expect",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/tools/go/expect",
        sha256 = "b2389159ddd768c6bd83a0cc92bbf9be01c32ca973c366fc224b79762d90dd79",
        strip_prefix = "golang.org/x/tools/go/expect@v0.1.1-deprecated",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/tools/go/expect/org_golang_x_tools_go_expect-v0.1.1-deprecated.zip",
            "http://ats.apps.svc/gomod/golang.org/x/tools/go/expect/org_golang_x_tools_go_expect-v0.1.1-deprecated.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/tools/go/expect/org_golang_x_tools_go_expect-v0.1.1-deprecated.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/tools/go/expect/org_golang_x_tools_go_expect-v0.1.1-deprecated.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_tools_go_packages_packagestest",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/tools/go/packages/packagestest",
        sha256 = "15792a78ef9338b2c08d5010b24211f85c4d39e8c31db316f1ca4a891605ed01",
        strip_prefix = "golang.org/x/tools/go/packages/packagestest@v0.1.1-deprecated",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/tools/go/packages/packagestest/org_golang_x_tools_go_packages_packagestest-v0.1.1-deprecated.zip",
            "http://ats.apps.svc/gomod/golang.org/x/tools/go/packages/packagestest/org_golang_x_tools_go_packages_packagestest-v0.1.1-deprecated.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/tools/go/packages/packagestest/org_golang_x_tools_go_packages_packagestest-v0.1.1-deprecated.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/tools/go/packages/packagestest/org_golang_x_tools_go_packages_packagestest-v0.1.1-deprecated.zip",
        ],
    )
    go_repository(
        name = "org_golang_x_xerrors",
        build_file_proto_mode = "disable_global",
        importpath = "golang.org/x/xerrors",
        sha256 = "df5dd109153c94d2f5c9601d28f558871094e37c42f8e3875f36db858d8be9f9",
        strip_prefix = "golang.org/x/xerrors@v0.0.0-20231012003039-104605ab7028",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/golang.org/x/xerrors/org_golang_x_xerrors-v0.0.0-20231012003039-104605ab7028.zip",
            "http://ats.apps.svc/gomod/golang.org/x/xerrors/org_golang_x_xerrors-v0.0.0-20231012003039-104605ab7028.zip",
            "https://cache.hawkingrei.com/gomod/golang.org/x/xerrors/org_golang_x_xerrors-v0.0.0-20231012003039-104605ab7028.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/golang.org/x/xerrors/org_golang_x_xerrors-v0.0.0-20231012003039-104605ab7028.zip",
        ],
    )
    go_repository(
        name = "org_gonum_v1_gonum",
        build_file_proto_mode = "disable_global",
        importpath = "gonum.org/v1/gonum",
        sha256 = "abdfee15ce7c9d2cd96b66468d3ae28d6054add4efbfc1b15fadfe3613f3d362",
        strip_prefix = "gonum.org/v1/gonum@v0.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gonum.org/v1/gonum/org_gonum_v1_gonum-v0.11.0.zip",
            "http://ats.apps.svc/gomod/gonum.org/v1/gonum/org_gonum_v1_gonum-v0.11.0.zip",
            "https://cache.hawkingrei.com/gomod/gonum.org/v1/gonum/org_gonum_v1_gonum-v0.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gonum.org/v1/gonum/org_gonum_v1_gonum-v0.11.0.zip",
        ],
    )
    go_repository(
        name = "org_gonum_v1_netlib",
        build_file_proto_mode = "disable_global",
        importpath = "gonum.org/v1/netlib",
        sha256 = "eeaeb60f410b86f59d97f15c5ef89096dc72aeb42bae55141738bf9866893938",
        strip_prefix = "gonum.org/v1/netlib@v0.0.0-20190313105609-8cb42192e0e0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gonum.org/v1/netlib/org_gonum_v1_netlib-v0.0.0-20190313105609-8cb42192e0e0.zip",
            "http://ats.apps.svc/gomod/gonum.org/v1/netlib/org_gonum_v1_netlib-v0.0.0-20190313105609-8cb42192e0e0.zip",
            "https://cache.hawkingrei.com/gomod/gonum.org/v1/netlib/org_gonum_v1_netlib-v0.0.0-20190313105609-8cb42192e0e0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gonum.org/v1/netlib/org_gonum_v1_netlib-v0.0.0-20190313105609-8cb42192e0e0.zip",
        ],
    )
    go_repository(
        name = "org_gonum_v1_plot",
        build_file_proto_mode = "disable_global",
        importpath = "gonum.org/v1/plot",
        sha256 = "eaa47ad966b3b67325c1f3ae704d566332c573b7cca79016cb4ffe82155aab39",
        strip_prefix = "gonum.org/v1/plot@v0.10.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gonum.org/v1/plot/org_gonum_v1_plot-v0.10.1.zip",
            "http://ats.apps.svc/gomod/gonum.org/v1/plot/org_gonum_v1_plot-v0.10.1.zip",
            "https://cache.hawkingrei.com/gomod/gonum.org/v1/plot/org_gonum_v1_plot-v0.10.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gonum.org/v1/plot/org_gonum_v1_plot-v0.10.1.zip",
        ],
    )
    go_repository(
        name = "org_modernc_cc_v3",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/cc/v3",
        sha256 = "fe3aeb761e55ce77a95b297321a122b4273aeffe1c08f48fc99310e065211f74",
        strip_prefix = "modernc.org/cc/v3@v3.40.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/cc/v3/org_modernc_cc_v3-v3.40.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/cc/v3/org_modernc_cc_v3-v3.40.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/cc/v3/org_modernc_cc_v3-v3.40.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/cc/v3/org_modernc_cc_v3-v3.40.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_ccgo_v3",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/ccgo/v3",
        sha256 = "bfc293300cd1ce656ba0ce0cee1f508afec2518bc4214a6b10ccfad6e8e6046e",
        strip_prefix = "modernc.org/ccgo/v3@v3.16.13",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/ccgo/v3/org_modernc_ccgo_v3-v3.16.13.zip",
            "http://ats.apps.svc/gomod/modernc.org/ccgo/v3/org_modernc_ccgo_v3-v3.16.13.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/ccgo/v3/org_modernc_ccgo_v3-v3.16.13.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/ccgo/v3/org_modernc_ccgo_v3-v3.16.13.zip",
        ],
    )
    go_repository(
        name = "org_modernc_ccorpus",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/ccorpus",
        sha256 = "3831b62a73a379b81ac927e17e3e9ffe2d44ad07c934505e1ae24eea8a26a6d3",
        strip_prefix = "modernc.org/ccorpus@v1.11.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/ccorpus/org_modernc_ccorpus-v1.11.6.zip",
            "http://ats.apps.svc/gomod/modernc.org/ccorpus/org_modernc_ccorpus-v1.11.6.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/ccorpus/org_modernc_ccorpus-v1.11.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/ccorpus/org_modernc_ccorpus-v1.11.6.zip",
        ],
    )
    go_repository(
        name = "org_modernc_golex",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/golex",
        sha256 = "3099b4f7e65cc38d113d6558f2a223ba4ce5288a930b182ac6ef679a96dbcfe5",
        strip_prefix = "modernc.org/golex@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/golex/org_modernc_golex-v1.1.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/golex/org_modernc_golex-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/golex/org_modernc_golex-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/golex/org_modernc_golex-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_httpfs",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/httpfs",
        sha256 = "0b5314649c1327a199397eb6fd52b3ce41c9d3bc6dd2a4dea565b5fb87c13f41",
        strip_prefix = "modernc.org/httpfs@v1.0.6",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/httpfs/org_modernc_httpfs-v1.0.6.zip",
            "http://ats.apps.svc/gomod/modernc.org/httpfs/org_modernc_httpfs-v1.0.6.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/httpfs/org_modernc_httpfs-v1.0.6.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/httpfs/org_modernc_httpfs-v1.0.6.zip",
        ],
    )
    go_repository(
        name = "org_modernc_libc",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/libc",
        sha256 = "5f98bedf9f0663b3b87555904ee41b82fe9d8e9ac5c47c9fac9a42a7fe232313",
        strip_prefix = "modernc.org/libc@v1.22.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/libc/org_modernc_libc-v1.22.2.zip",
            "http://ats.apps.svc/gomod/modernc.org/libc/org_modernc_libc-v1.22.2.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/libc/org_modernc_libc-v1.22.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/libc/org_modernc_libc-v1.22.2.zip",
        ],
    )
    go_repository(
        name = "org_modernc_mathutil",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/mathutil",
        sha256 = "3a9e2065897e172b4c092c3098e15a2d66bc2700432f88ba6812c1b6b0acf2b2",
        strip_prefix = "modernc.org/mathutil@v1.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/mathutil/org_modernc_mathutil-v1.6.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/mathutil/org_modernc_mathutil-v1.6.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/mathutil/org_modernc_mathutil-v1.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/mathutil/org_modernc_mathutil-v1.6.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_memory",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/memory",
        sha256 = "f79e8ada14c36d08817ee2bf6b2103f65c1a61a91b042b59016465869624043c",
        strip_prefix = "modernc.org/memory@v1.5.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/memory/org_modernc_memory-v1.5.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/memory/org_modernc_memory-v1.5.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/memory/org_modernc_memory-v1.5.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/memory/org_modernc_memory-v1.5.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_opt",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/opt",
        sha256 = "294b1b80137cb86292c8893481d545eee90b17b84b6ad1dcb2e6c9bb523a2d9e",
        strip_prefix = "modernc.org/opt@v0.1.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/opt/org_modernc_opt-v0.1.3.zip",
            "http://ats.apps.svc/gomod/modernc.org/opt/org_modernc_opt-v0.1.3.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/opt/org_modernc_opt-v0.1.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/opt/org_modernc_opt-v0.1.3.zip",
        ],
    )
    go_repository(
        name = "org_modernc_parser",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/parser",
        sha256 = "e50f98025a0dfff5ffe5fe5dba38a11f85e5402cdcb9ed7ed0a8d3db6d811b67",
        strip_prefix = "modernc.org/parser@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/parser/org_modernc_parser-v1.1.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/parser/org_modernc_parser-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/parser/org_modernc_parser-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/parser/org_modernc_parser-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_sortutil",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/sortutil",
        sha256 = "30f47ffd690ba68e88bcb7f2a1f3d61505580c0d62ba32c2bab5017077208f60",
        strip_prefix = "modernc.org/sortutil@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/sortutil/org_modernc_sortutil-v1.2.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/sortutil/org_modernc_sortutil-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/sortutil/org_modernc_sortutil-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/sortutil/org_modernc_sortutil-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_sqlite",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/sqlite",
        sha256 = "be0501f87458962a00c8fb07d1f131af010a534cd6ffb654c570be35b9b608d5",
        strip_prefix = "modernc.org/sqlite@v1.18.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/sqlite/org_modernc_sqlite-v1.18.2.zip",
            "http://ats.apps.svc/gomod/modernc.org/sqlite/org_modernc_sqlite-v1.18.2.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/sqlite/org_modernc_sqlite-v1.18.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/sqlite/org_modernc_sqlite-v1.18.2.zip",
        ],
    )
    go_repository(
        name = "org_modernc_strutil",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/strutil",
        sha256 = "1ea20b81cf3fd6efad4bb1b791255cc2fd486111d5e9f2cb0e551e9d39aa3f8f",
        strip_prefix = "modernc.org/strutil@v1.2.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/strutil/org_modernc_strutil-v1.2.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/strutil/org_modernc_strutil-v1.2.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/strutil/org_modernc_strutil-v1.2.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/strutil/org_modernc_strutil-v1.2.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_tcl",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/tcl",
        sha256 = "f966db0dd1ccbc7f8d5ac2e752b64c3be343aa3f92215ed98b6f2a51b7abbb64",
        strip_prefix = "modernc.org/tcl@v1.13.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/tcl/org_modernc_tcl-v1.13.2.zip",
            "http://ats.apps.svc/gomod/modernc.org/tcl/org_modernc_tcl-v1.13.2.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/tcl/org_modernc_tcl-v1.13.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/tcl/org_modernc_tcl-v1.13.2.zip",
        ],
    )
    go_repository(
        name = "org_modernc_token",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/token",
        sha256 = "3efaa49e9fb10569da9e09e785fa230cd5c0f50fcf605f3b5439dfcd61577c58",
        strip_prefix = "modernc.org/token@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/token/org_modernc_token-v1.1.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/token/org_modernc_token-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/token/org_modernc_token-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/token/org_modernc_token-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_y",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/y",
        sha256 = "cce55de6a0fe8fa41f1bf95184316f02f90966a12a34bc38534d610920be4720",
        strip_prefix = "modernc.org/y@v1.1.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/y/org_modernc_y-v1.1.0.zip",
            "http://ats.apps.svc/gomod/modernc.org/y/org_modernc_y-v1.1.0.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/y/org_modernc_y-v1.1.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/y/org_modernc_y-v1.1.0.zip",
        ],
    )
    go_repository(
        name = "org_modernc_z",
        build_file_proto_mode = "disable_global",
        importpath = "modernc.org/z",
        sha256 = "5be23ef96669963e52d25b787d71028fff4fe1c468dec20aac59c9512caa2eb7",
        strip_prefix = "modernc.org/z@v1.5.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/modernc.org/z/org_modernc_z-v1.5.1.zip",
            "http://ats.apps.svc/gomod/modernc.org/z/org_modernc_z-v1.5.1.zip",
            "https://cache.hawkingrei.com/gomod/modernc.org/z/org_modernc_z-v1.5.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/modernc.org/z/org_modernc_z-v1.5.1.zip",
        ],
    )
    go_repository(
        name = "org_mongodb_go_mongo_driver",
        build_file_proto_mode = "disable_global",
        importpath = "go.mongodb.org/mongo-driver",
        sha256 = "72d6d482c70104374d8d5ac91653b46aec4c7c1e610e0fd4a82d5d88b4a65b3e",
        strip_prefix = "go.mongodb.org/mongo-driver@v1.13.1",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.mongodb.org/mongo-driver/org_mongodb_go_mongo_driver-v1.13.1.zip",
            "http://ats.apps.svc/gomod/go.mongodb.org/mongo-driver/org_mongodb_go_mongo_driver-v1.13.1.zip",
            "https://cache.hawkingrei.com/gomod/go.mongodb.org/mongo-driver/org_mongodb_go_mongo_driver-v1.13.1.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.mongodb.org/mongo-driver/org_mongodb_go_mongo_driver-v1.13.1.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_atomic",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/atomic",
        sha256 = "8109325abe17488245878b07f3c35b10ba7d1aa3310f792968f5b9deba432e2c",
        strip_prefix = "go.uber.org/atomic@v1.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/atomic/org_uber_go_atomic-v1.11.0.zip",
            "http://ats.apps.svc/gomod/go.uber.org/atomic/org_uber_go_atomic-v1.11.0.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/atomic/org_uber_go_atomic-v1.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/atomic/org_uber_go_atomic-v1.11.0.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_automaxprocs",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/automaxprocs",
        sha256 = "964c6f548f7ee6df9fa3a9080d722c7950060bda0cb84ff9e2ae065f078813c4",
        strip_prefix = "go.uber.org/automaxprocs@v1.6.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/automaxprocs/org_uber_go_automaxprocs-v1.6.0.zip",
            "http://ats.apps.svc/gomod/go.uber.org/automaxprocs/org_uber_go_automaxprocs-v1.6.0.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/automaxprocs/org_uber_go_automaxprocs-v1.6.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/automaxprocs/org_uber_go_automaxprocs-v1.6.0.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_goleak",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/goleak",
        sha256 = "70edef0ce7d830d992f024e527fd3452069b884f94a27787a718bd68dd620702",
        strip_prefix = "go.uber.org/goleak@v1.3.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/goleak/org_uber_go_goleak-v1.3.0.zip",
            "http://ats.apps.svc/gomod/go.uber.org/goleak/org_uber_go_goleak-v1.3.0.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/goleak/org_uber_go_goleak-v1.3.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/goleak/org_uber_go_goleak-v1.3.0.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_mock",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/mock",
        sha256 = "eb2f59d1ebba968e1c8c8835b326d8ae0e672ee921fe14eb38c85ecb16bd2d32",
        strip_prefix = "go.uber.org/mock@v0.5.2",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/mock/org_uber_go_mock-v0.5.2.zip",
            "http://ats.apps.svc/gomod/go.uber.org/mock/org_uber_go_mock-v0.5.2.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/mock/org_uber_go_mock-v0.5.2.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/mock/org_uber_go_mock-v0.5.2.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_multierr",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/multierr",
        sha256 = "2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3",
        strip_prefix = "go.uber.org/multierr@v1.11.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/multierr/org_uber_go_multierr-v1.11.0.zip",
            "http://ats.apps.svc/gomod/go.uber.org/multierr/org_uber_go_multierr-v1.11.0.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/multierr/org_uber_go_multierr-v1.11.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/multierr/org_uber_go_multierr-v1.11.0.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_tools",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/tools",
        sha256 = "988dba9c5074080240d33d98e8ce511532f728698db7a9a4ac316c02c94030d6",
        strip_prefix = "go.uber.org/tools@v0.0.0-20190618225709-2cfd321de3ee",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/tools/org_uber_go_tools-v0.0.0-20190618225709-2cfd321de3ee.zip",
            "http://ats.apps.svc/gomod/go.uber.org/tools/org_uber_go_tools-v0.0.0-20190618225709-2cfd321de3ee.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/tools/org_uber_go_tools-v0.0.0-20190618225709-2cfd321de3ee.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/tools/org_uber_go_tools-v0.0.0-20190618225709-2cfd321de3ee.zip",
        ],
    )
    go_repository(
        name = "org_uber_go_zap",
        build_file_proto_mode = "disable_global",
        importpath = "go.uber.org/zap",
        sha256 = "b994b96ff0bb504a3d58288ab88b9f3c6604689ea1afb69d25b509769705a6c2",
        strip_prefix = "go.uber.org/zap@v1.27.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.uber.org/zap/org_uber_go_zap-v1.27.0.zip",
            "http://ats.apps.svc/gomod/go.uber.org/zap/org_uber_go_zap-v1.27.0.zip",
            "https://cache.hawkingrei.com/gomod/go.uber.org/zap/org_uber_go_zap-v1.27.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.uber.org/zap/org_uber_go_zap-v1.27.0.zip",
        ],
    )
    go_repository(
        name = "tech_einride_go_aip",
        build_file_proto_mode = "disable_global",
        importpath = "go.einride.tech/aip",
        sha256 = "d3e11dca3b1aba4fed53d90c0a984eacf3aa3e47ef12b2e445ff8d5d185fe9db",
        strip_prefix = "go.einride.tech/aip@v0.66.0",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/go.einride.tech/aip/tech_einride_go_aip-v0.66.0.zip",
            "http://ats.apps.svc/gomod/go.einride.tech/aip/tech_einride_go_aip-v0.66.0.zip",
            "https://cache.hawkingrei.com/gomod/go.einride.tech/aip/tech_einride_go_aip-v0.66.0.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/go.einride.tech/aip/tech_einride_go_aip-v0.66.0.zip",
        ],
    )
    go_repository(
        name = "tools_gotest_v3",
        build_file_proto_mode = "disable_global",
        importpath = "gotest.tools/v3",
        sha256 = "9c1e4b8a1477c52441aafc2025a4b4e8bc300a9817c5549c0dc7fffef34bdaef",
        strip_prefix = "gotest.tools/v3@v3.0.3",
        urls = [
            "http://bazel-cache.pingcap.net:8080/gomod/gotest.tools/v3/tools_gotest_v3-v3.0.3.zip",
            "http://ats.apps.svc/gomod/gotest.tools/v3/tools_gotest_v3-v3.0.3.zip",
            "https://cache.hawkingrei.com/gomod/gotest.tools/v3/tools_gotest_v3-v3.0.3.zip",
            "https://storage.googleapis.com/pingcapmirror/gomod/gotest.tools/v3/tools_gotest_v3-v3.0.3.zip",
        ],
    )
