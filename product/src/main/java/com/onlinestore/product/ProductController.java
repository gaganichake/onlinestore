package com.onlinestore.product;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductController {

	@AutoWire
	ProductService productService;

	@GetMapping("/")
	public String index() {
		return "Looking for products? try /product";
	}

	@GetMapping("/product")
	public Product greeting(@RequestParam(value = "which", defaultValue = "features") String name) {
		return new Product(1, "features product");
	}

	@PostMapping("/product/")
	public void greeting(@RequestParam(value = "id") String item, @RequestParam(value = "content") String desc) {
		productService.add(item, desc)
		return new Product(1, "features product");
	}

	@PostMapping("/product/")
	public Product greeting(@RequestParam(value = "item") String item) {

		return productService.getProduct(item);
	}

}
