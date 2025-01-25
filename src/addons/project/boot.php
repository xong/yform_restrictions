<?php

/**
 * @var rex_addon $this
 */

if (rex_addon::get('developer')->isAvailable()) {
    rex_developer_manager::setBasePath(rex_path::src());
}

if (rex::isBackend()) {
    if (rex_be_controller::getCurrentPage() === 'yform/manager/data_edit') {
        // restrict relation selects
        \rex_view::setJsProperty('userRestrictions', \Project\Helper::getUserRestrictions());
        rex_view::addJsFile($this->getAssetsUrl('user-restrictions.js'));
    }

    \Project\Helper::restrictYFormTables();
}

// register a custom yrewrite scheme
// rex_yrewrite::setScheme(new rex_project_rewrite_scheme());

// register yform template path
// rex_yform::addTemplatePath($this->getPath('yform-templates'));
