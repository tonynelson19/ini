/**
 * @extends mxunit.framework.TestCase
 */
component {

	function beforeTests() {

		filePath = expandPath("/ini/config.ini");
		ini = new Ini(filePath);

	}

	function testSectionsIsAStruct() {

		var sections = ini.getSections();

		assertIsStruct(sections);

	}

	function testSectionsHasCorrectKeyCount() {

		var sections = ini.getSections();

		assertEquals(structCount(sections), 4);

	}

	function testSimpleSectionIsAStruct() {

		var section = ini.getSection("production");

		assertIsStruct(section);

	}

	function testSimpleSectionHasCorrectKeyCount() {

		var section = ini.getSection("production");

		assertEquals(structCount(section), 3);

	}

	function testInheritedSectionIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section);

	}

	function testInheritedSectionHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section), 13);

	}

	function testInheritedSectionHasCorrectKeys() {

		var section = ini.getSection("development");

		assertEquals(section["development"], "true");
		assertEquals(section["environment"], "development");
		assertIsArray(section["array"]);
		assertTrue(arrayLen(section["array"]), 3);
		assertIsStruct(section["struct"]);
		assertTrue(structCount(section["struct"]), 2);
		assertEquals(section["yes"], "true");
		assertIsStruct(section["nested"]);
		assertTrue(structCount(section["nested"]), 3);
		assertEquals(section["nested.foo"], "1");
		assertEquals(section["nested.bar"], "2");
		assertIsStruct(section["nested.baz"]);
		assertTrue(structCount(section["nested.baz"]), 1);
		assertEquals(section["staging"], "true");
		assertEquals(section["testing"], "true");
		assertEquals(section["production"], "true");
		assertEquals(section["foo"], "staging");

	}

	function testPartiallyInheritedSectionHasCorrectKeyCount() {

		var section = ini.getSection("testing");

		assertEquals(structCount(section), 5);

	}

	function testNestedPropertyExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested"));

	}

	function testNestedPropertyIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section["nested"]);

	}

	function testNestedPropertyHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section["nested"]), 3);

	}

	function testNestedPropertyHasCorrectKeyValues() {

		var section = ini.getSection("development");

		assertEquals(section["nested"]["foo"], "1");
		assertEquals(section["nested"]["bar"], "2");

	}

	function testNestedPropertyHasCorrectKeys() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["nested"], "foo"));
		assertTrue(structKeyExists(section["nested"], "bar"));

	}

	function testNestedPropertyStillExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "nested.foo"));
		assertTrue(structKeyExists(section, "nested.bar"));

	}

	function testJSONStructExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "struct"));

	}

	function testJSONStructIsAStruct() {

		var section = ini.getSection("development");

		assertIsStruct(section["struct"]);

	}

	function testJSONStructHasCorrectKeyCount() {

		var section = ini.getSection("development");

		assertEquals(structCount(section["struct"]), 2);

	}

	function testJSONStructHasCorrectKeys() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section["struct"], "1"));
		assertTrue(structKeyExists(section["struct"], "0"));

	}

	function testJSONStructHasCorrectKeyValues() {

		var section = ini.getSection("development");

		assertEquals(section["struct"]["1"], "yes");
		assertEquals(section["struct"]["0"], "no");

	}

	function testJSONArrayExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "array"));

	}

	function testJSONArrayIsAnArray() {

		var section = ini.getSection("development");

		assertIsArray(section["array"]);

	}

	function testJSONStringIsABoolean() {

		var section = ini.getSection("development");

		assertEquals(section["yes"], "true");

	}

	function testInheritedValueExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "production"));

	}

	function testInheritedValueIsCorrect() {

		var section = ini.getSection("development");

		assertEquals(section["production"], "true");

	}

	function testOverriddenValueExists() {

		var section = ini.getSection("development");

		assertTrue(structKeyExists(section, "environment"));

	}

	function testOverriddenValueIsCorrect() {

		var section = ini.getSection("development");

		assertEquals(section["environment"], "development");

	}

}