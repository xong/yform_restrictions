<?php

$userId = rex_get('benutzer_waehlen', 'array')['user_id'] ?? rex_post('benutzer', 'array')['user_id'] ?? 0;

if ($userId) {

    $form = rex_config_form::factory('yform_restrictions_' . $userId, 'Benutzer');
    $form->addRawField('<p class="help-block">Hier können die Benutzerrechte für YForm-Tabellen eingeschränkt werden.</p>');

    $field = $form->addHiddenField('user_id', $userId, ['class' => 'form-control form-control-static']);

    $elements = [
        [
            'table'   => 'yf_location',
            'heading' => 'Standorte',
            'select'  => 'name',
        ],
    ];

    foreach ($elements as $data) {

        $tableName = $data['table'];

        $form->addFieldset($data['heading']);

        $select = new rex_select();
        $select->setMultiple(true);
        $select->addSqlOptions('SELECT ' . $data['select'] . ', id FROM ' . rex::getTable($tableName) . ($data['where'] ?? '') . ($data['order'] ?? ''));

        /** @var rex_form_select_element $field */
        $field = $form->addSelectField(rex::getTable($data['key'] ?? $tableName), null, ['class' => 'form-control selectpicker']);
        $field->setSelect($select);
    }
}
else {
    class rex_yform_restrictions_form extends rex_form_base
    {
        use rex_factory_trait;

        /**
         * @param null|string $fieldset
         * @param bool        $debug
         */
        protected function __construct($fieldset = null, $debug = false)
        {
            parent::__construct($fieldset, md5($fieldset), 'get', $debug);
            parent::loadBackendConfig();

            $this->addControlField(
                null,
                $this->addField(
                    'button',
                    'save',
                    'Benutzer bearbeiten',
                    [
                        'type' => 'submit',
                        'internal::useArraySyntax' => false,
                        'internal::fieldSeparateEnding' => true
                    ],
                    false
                )
            );
        }

        /**
         * @param string      $namespace `rex_config` namespace, usually the package key
         * @param null|string $fieldset
         * @param bool        $debug
         *
         * @return static
         */
        public static function factory($fieldset = null, $debug = false)
        {
            $class = static::getFactoryClass();
            return new $class($fieldset, $debug);
        }


        protected function getValue($name)
        {
            return rex_get($name);
        }

        protected function save()
        {
            return true;
        }

        public function get()
        {
            $s = parent::get();

            // remove csrf token
            $s = preg_replace('~<input\s+type="hidden"\s+name="' . rex_csrf_token::PARAM . '"[^>]*>~is', '', $s);

            return $s;
        }
    }

    $form = rex_yform_restrictions_form::factory('Benutzer wählen');
    $form->addRawField('<p class="help-block">Hier können die Benutzerrechte für YForm-Tabellen eingeschränkt werden.</p>');

    $select = new rex_select();
    $select->setName('user_id');
    $select->addSqlOptions('SELECT name, id FROM ' . rex::getTable('user'));
    $field = $form->addSelectField('user_id', null, ['class' => 'form-control selectpicker']);
    $field->setSelect($select);
    $field->setLabel('Benutzer wählen');
}

$fragment = new rex_fragment();
$fragment->setVar('class', 'edit', false);
$fragment->setVar('title', 'Benutzerrechte', false);
$fragment->setVar('body', $form->get(), false);
echo $fragment->parse('core/page/section.php');
