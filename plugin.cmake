add_standard_plugin_tests(NO_SERVER_TESTS NO_CLIENT_TESTS)
add_python_test(analysis PLUGIN minerva BIND_SERVER)
add_python_test(dataset PLUGIN minerva BIND_SERVER)
add_python_test(geojson PLUGIN minerva BIND_SERVER)
add_python_test(import_analyses PLUGIN minerva BIND_SERVER)
add_python_test(session PLUGIN minerva BIND_SERVER)
add_python_test(twofishes PLUGIN minerva BIND_SERVER)
add_python_test(wms PLUGIN minerva BIND_SERVER)

set_property(TEST python_static_analysis_minerva PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.analysis PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.dataset PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.geojson PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.import_analyses PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.session PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.twofishes PROPERTY LABELS minerva_server)
set_property(TEST server_minerva.wms PROPERTY LABELS minerva_server)

add_web_client_test(
    minerva "${PROJECT_SOURCE_DIR}/plugins/minerva/plugin_tests/client/minervaSpec.js"
    PLUGIN minerva
    ENABLEDPLUGINS "gravatar" "jobs" "database_assetstore" "girder_ktile"
    SETUP_MODULES "${_pluginDir}/plugin_tests/create_user.py"
)
set_property(TEST web_client_minerva.minerva PROPERTY LABELS minerva_client)

add_web_client_test(
    geojson "${PROJECT_SOURCE_DIR}/plugins/minerva/plugin_tests/client/geojsonUtilSpec.js"
    PLUGIN minerva
    ENABLEDPLUGINS "gravatar" "jobs" "database_assetstore" "girder_ktile"
)
set_property(TEST web_client_minerva.geojson PROPERTY LABELS minerva_client)

set_property(TEST puglint_minerva PROPERTY LABELS minerva_client)
set_property(TEST eslint_minerva PROPERTY LABELS minerva_client)

add_puglint_test(minerva_external "${CMAKE_CURRENT_LIST_DIR}/web_external/templates")
set_property(TEST puglint_minerva_external PROPERTY LABELS minerva_client)

add_eslint_test(minerva_tests "${CMAKE_CURRENT_LIST_DIR}/plugin_tests" ESLINT_CONFIG_FILE "${PROJECT_SOURCE_DIR}/clients/web/test/.eslintrc.json")
set_property(TEST eslint_minerva_tests PROPERTY LABELS minerva_client)
add_eslint_test(minerva_external "${CMAKE_CURRENT_LIST_DIR}/web_external" ESLINT_CONFIG_FILE "${CMAKE_CURRENT_LIST_DIR}/.eslintrc.js"
ESLINT_IGNORE_FILE "${CMAKE_CURRENT_LIST_DIR}/.eslintignore"
)
set_property(TEST eslint_minerva_external PROPERTY LABELS minerva_client)
