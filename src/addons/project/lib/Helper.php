<?php

namespace Project;

class Helper
{
    public static
    function restrictYFormTables()
    {
        // prevent edit view for not allowed datasets
        \rex_extension::register('YFORM_MANAGER_DATA_PAGE', function (\rex_extension_point $ep) {
            $id = rex_get('data_id', 'int');

            if (empty($id)) {
                return;
            }

            /** @var \rex_yform_manager $manager */
            $manager      = $ep->getSubject();
            $tableName    = $manager->table->getTableName();
            $restrictions = self::getUserRestrictions($tableName);

            foreach ($restrictions as $key => $restriction) {
                if (!empty($restrictions) and !in_array($id, $restrictions)) {
                    \rex_response::sendRedirect(\rex::getServer() . 'redaxo/' . \rex_url::currentBackendPage([
                            'table_name' => $tableName,
                        ], false));
                }
            }
        });

        // hide not editable datasets
        \rex_extension::register('YFORM_DATA_LIST_QUERY', function (\rex_extension_point $ep) {
            /** @var \rex_yform_manager_query $query */
            $query     = $ep->getSubject();
            $tableName = $query->getTableName();

            switch ($tableName) {
                case \rex::getTable('yf_location'):
                    $restrictions = self::getUserRestrictions($tableName);
                    if (!empty($restrictions)) {
                        $query->where('id', $restrictions);
                    }
                    break;
            }

            return $query;
        });
    }

    public static
    function getUserRestrictions($key = null)
    {
        static $restrictions = null;

        if (is_null($restrictions)) {
            $projectsByCategory = [];
            $restrictions       = \rex_config::get('yform_restrictions_' . \rex::getUser()->getId());

            foreach ($restrictions as $k => $data) {
                if (is_string($data)) {
                    $restrictions[$k] = $data = explode('|', trim($data, '|'));
                } else if (empty($data)) {
                    $restrictions[$k] = $data = [];
                }

                $splittedKeys = explode(':', $k, 2);

                if (count($splittedKeys) === 2) {
                    $restrictions[$splittedKeys[0]][$splittedKeys[1]] = $restrictions[$k];
                    unset($restrictions[$k]);
                }
            }
        }

        if (is_null($key)) {
            return $restrictions;
        }

        return $restrictions[$key] ?? [];
    }
}
