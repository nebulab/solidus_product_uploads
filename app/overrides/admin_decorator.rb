Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_documents",
                     :insert_after => "[data-hook='admin_product_form_meta_description']",
                     :partial => "spree/admin/shared/document",
                     )
