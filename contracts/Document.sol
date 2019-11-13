pragma solidity >=0.4.24 <0.6.0;

contract Document {
    struct DocumentEntry {
        string checksum;
        string name;
        string comment;
        bool isSet;
        address setBy;
    }

    mapping (string => DocumentEntry) documentMapping;

    /**
     * Read an entry from the ledger.
     **/
    function get(string memory _checksum) public view returns(string memory, string memory, string memory, address) {
        // Check if the document exists.
        require(documentMapping[_checksum].isSet, "Document does not exists.");
        // Return document.
        return(documentMapping[_checksum].checksum, documentMapping[_checksum].name,
            documentMapping[_checksum].comment,documentMapping[_checksum].setBy);
    }

    /**
     * Add a new entry to the ledger.
     *
     * Example: "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", "Name", "Comment"
     **/
    function set(string memory _checksum, string memory _name, string memory _comment) public {
        // Check if the document does not exists.
        require(!documentMapping[_checksum].isSet, "Document already exists.");
        // Set input values of the document.
        documentMapping[_checksum].checksum = _checksum;
        documentMapping[_checksum].name = _name;
        documentMapping[_checksum].comment = _comment;
        documentMapping[_checksum].isSet = true;
        documentMapping[_checksum].setBy = msg.sender;
    }
}
