package com.forever.young.repository;

import java.util.List;

import com.forever.young.entity.ProductFileUpload;

public interface ProductFileUploadRepository {
	
	public void insert(ProductFileUpload upload);
	public void delete(String image_save_name);
	public List<ProductFileUpload> findByProductNo(int product_no);

}
