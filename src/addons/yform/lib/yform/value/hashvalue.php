<?php

/**
 * yform.
 *
 * @author jan.kristinus[at]redaxo[dot]org Jan Kristinus
 * @author <a href="http://www.yakamara.de">www.yakamara.de</a>
 */

class rex_yform_value_hashvalue extends rex_yform_value_abstract
{
    public function postFormAction(): void
    {
        if ('' != $this->params['value_pool']['email'][$this->getElement('field')]) {
            $salt = $this->getElement('salt');
            $origin = $this->params['value_pool']['email'][$this->getElement(3)];
            $func = $this->getElement('function');

            if ('' == $func || !function_exists($func)) {
                $func = 'md5';
            }

            $hash = hash($func, $origin . $salt);

            $this->params['value_pool']['email'][$this->getName()] = $hash;

            if ($this->saveInDb()) {
                $this->params['value_pool']['sql'][$this->getName()] = $hash;
            }
        } else {
            $this->params['value_pool']['email'][$this->getName()] = $this->getValue();
        }
    }

    public function getDescription(): string
    {
        return 'hashvalue|name|[label]|field|(md5/sha1/sha512/...)|[salt]|[no_db]';
    }

    public function getDefinitions(): array
    {
        return [
            'type' => 'value',
            'name' => 'hashvalue',
            'values' => [
                'name' => ['type' => 'name',    'label' => rex_i18n::msg('yform_values_defaults_name')],
                'label' => ['type' => 'text',    'label' => rex_i18n::msg('yform_values_defaults_label')],
                'field' => ['type' => 'select_name',    'label' => rex_i18n::msg('yform_values_hashvalue_field')],
                'function' => ['type' => 'text',    'label' => rex_i18n::msg('yform_values_hashvalue_function')],
                'salt' => ['type' => 'text',    'label' => rex_i18n::msg('yform_values_hashvalue_salt')],
                'no_db' => ['type' => 'no_db',  'label' => rex_i18n::msg('yform_values_defaults_table')],
            ],
            'description' => rex_i18n::msg('yform_values_hashvalue_description'),
            'db_type' => ['text', 'varchar(191)'],
            'multi_edit' => false,
            'deprecated' => rex_i18n::msg('yform_values_hashvalue_deprecated'),
        ];
    }

    public static function getSearchField($params)
    {
        rex_yform_value_text::getSearchField($params);
    }

    public static function getSearchFilter($params)
    {
        return rex_yform_value_text::getSearchFilter($params);
    }

    public static function getListValue($params)
    {
        return rex_yform_value_text::getListValue($params);
    }
}
