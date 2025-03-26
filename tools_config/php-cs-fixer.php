<?php

use PhpCsFixer\Config;
use PhpCsFixer\Finder;

$finder = Finder::create()
    ->in(getcwd())
    ->exclude(['vendor']);

return (new Config())
    ->setRiskyAllowed(true)
    ->setRules([
        '@PSR12' => true,
        'braces' => [
            'allow_single_line_closure' => false,
            'position_after_functions_and_oop_constructs' => 'next',
        ],
        'class_attributes_separation' => [
            'elements' => ['method' => 'one'],
        ],
        'no_whitespace_before_comma_in_array' => true,
        'blank_lines_before_namespace' => true,
        'no_extra_blank_lines' => [
            'tokens' => [
                'extra',
                'return',
                'throw',
                'use',
                'parenthesis_brace_block',
            ],
        ],
        'return_type_declaration' => ['space_before' => 'none'],
        'phpdoc_separation' => true,
        'phpdoc_order' => true,
        'no_superfluous_phpdoc_tags' => true,
        'ordered_imports' => true,
    ])
    ->setFinder($finder);
