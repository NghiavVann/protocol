// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/Strings.sol";

/// @title SVGGenerate
/// @notice Contains a function to generate the G7 Position NFT.
/// @notice Function `generateSVG()` will be consumed by the `PositionMetadata` contract.
library SVGGenerate {
    using Strings for uint256;

    // todo: add proper SVG position params here. Below is just a placeholder
    struct PositionParams {
        string poolId;
        address owner;
    }

    // Add positionParams in the future
    function generateSVG() internal pure returns (string memory svg) {
        svg = string(
            abi.encodePacked(
                generateSVGBackground()
            )
        );
    }

    function generateSVGBackground() private pure returns (string memory svg) {
        svg = string(
            abi.encodePacked(
                '<svg width="500" height="500" viewBox="0 0 2000 2000" fill="none" xmlns="http://www.w3.org/2000/svg">',
                '<mask id="mask0_1_100" maskUnits="userSpaceOnUse" x="0" y="0" width="2000" height="2000">',
                '<path d="M2000 0H0V2000H2000V0Z" fill="white" />',
                '</mask>',
                '<g mask="url(#mask0_1_100)">',
                '<path d="M2768.16 18.7289L3021 72.4771V-28.6483L2768.16 -82.3965V-28.6483L2515.33 -82.3965V-28.6483L2262.49 -82.3965V-28.6483L2009.66 -82.3965V-29.0191L1758.51 -82.3965V-28.6483L1505.67 -82.3965V-28.6483L1252.84 -82.3965V-28.6483L1000 -82.3965V-28.6483L747.164 -82.3965V-28.6483L494.329 -82.3965V-28.6483L241.493 -82.3965V-28.6483L-11.3428 -82.3965V-29.0191L-262.493 -82.3965V-28.6483L-515.329 -82.3965V-28.6483L-768.164 -82.3965V-28.6483L-1021 -82.3965V18.7289L-768.164 72.4771V18.7289L-515.329 72.4771V18.7289L-262.493 72.4771V18.7289L-9.65723 72.4771V19.0997L241.493 72.4771V18.7289L494.329 72.4771V18.7289L747.164 72.4771V18.7289L1000 72.4771V18.7289L1252.84 72.4771V18.7289L1505.67 72.4771V18.7289L1758.51 72.4771V18.7289L2011.34 72.4771V19.0997L2262.49 72.4771V18.7289L2515.33 72.4771V18.7289L2768.16 72.4771V18.7289Z" fill="#1B1B1B" />'
                '<path d="M2768.16 164.125L3021 217.857V116.731L2768.16 63V116.731L2515.33 63V116.731L2262.49 63V116.731L2009.66 63V116.377L1758.51 63V116.731L1505.67 63V116.731L1252.84 63V116.731L1000 63V116.731L747.164 63V116.731L494.329 63V116.731L241.493 63V116.731L-11.3428 63V116.377L-262.493 63V116.731L-515.329 63V116.731L-768.164 63V116.731L-1021 63V164.125L-768.164 217.857V164.125L-515.329 217.857V164.125L-262.493 217.857V164.125L-9.65723 217.857V164.479L241.493 217.857V164.125L494.329 217.857V164.125L747.164 217.857V164.125L1000 217.857V164.125L1252.84 217.857V164.125L1505.67 217.857V164.125L1758.51 217.857V164.125L2011.34 217.857V164.479L2262.49 217.857V164.125L2515.33 217.857V164.125L2768.16 217.857V164.125Z" fill="#1B1B1B" />'
                '<path d="M2768.16 327.952L3021 381.683V280.557L2768.16 226.826V280.557L2515.33 226.826V280.557L2262.49 226.826V280.557L2009.66 226.826V280.204L1758.51 226.826V280.557L1505.67 226.826V280.557L1252.84 226.826V280.557L1000 226.826V280.557L747.164 226.826V280.557L494.329 226.826V280.557L241.493 226.826V280.557L-11.3428 226.826V280.204L-262.493 226.826V280.557L-515.329 226.826V280.557L-768.164 226.826V280.557L-1021 226.826V327.952L-768.164 381.683V327.952L-515.329 381.683V327.952L-262.493 381.683V327.952L-9.65723 381.683V328.306L241.493 381.683V327.952L494.329 381.683V327.952L747.164 381.683V327.952L1000 381.683V327.952L1252.84 381.683V327.952L1505.67 381.683V327.952L1758.51 381.683V327.952L2011.34 381.683V328.306L2262.49 381.683V327.952L2515.33 381.683V327.952L2768.16 381.683V327.952Z" fill="#1B1B1B" />'
                '<path d="M2768.16 482.557L3021 536.305V435.18L2768.16 381.432V435.18L2515.33 381.432V435.18L2262.49 381.432V435.18L2009.66 381.432V434.809L1758.51 381.432V435.18L1505.67 381.432V435.18L1252.84 381.432V435.18L1000 381.432V435.18L747.164 381.432V435.18L494.329 381.432V435.18L241.493 381.432V435.18L-11.3428 381.432V434.809L-262.493 381.432V435.18L-515.329 381.432V435.18L-768.164 381.432V435.18L-1021 381.432V482.557L-768.164 536.305V482.557L-515.329 536.305V482.557L-262.493 536.305V482.557L-9.65723 536.305V482.928L241.493 536.305V482.557L494.329 536.305V482.557L747.164 536.305V482.557L1000 536.305V482.557L1252.84 536.305V482.557L1505.67 536.305V482.557L1758.51 536.305V482.557L2011.34 536.305V482.928L2262.49 536.305V482.557L2515.33 536.305V482.557L2768.16 536.305V482.557Z" fill="#1B1B1B" />'
                '<path d="M2768.16 637.178L3021 690.909V589.784L2768.16 536.053V589.784L2515.33 536.053V589.784L2262.49 536.053V589.784L2009.66 536.053V589.43L1758.51 536.053V589.784L1505.67 536.053V589.784L1252.84 536.053V589.784L1000 536.053V589.784L747.164 536.053V589.784L494.329 536.053V589.784L241.493 536.053V589.784L-11.3428 536.053V589.43L-262.493 536.053V589.784L-515.329 536.053V589.784L-768.164 536.053V589.784L-1021 536.053V637.178L-768.164 690.909V637.178L-515.329 690.909V637.178L-262.493 690.909V637.178L-9.65723 690.909V637.532L241.493 690.909V637.178L494.329 690.909V637.178L747.164 690.909V637.178L1000 690.909V637.178L1252.84 690.909V637.178L1505.67 690.909V637.178L1758.51 690.909V637.178L2011.34 690.909V637.532L2262.49 690.909V637.178L2515.33 690.909V637.178L2768.16 690.909V637.178Z" fill="#1B1B1B" />'
                '<path d="M2768.16 791.784L3021 845.515V744.39L2768.16 690.658V744.39L2515.33 690.658V744.39L2262.49 690.658V744.39L2009.66 690.658V744.036L1758.51 690.658V744.39L1505.67 690.658V744.39L1252.84 690.658V744.39L1000 690.658V744.39L747.164 690.658V744.39L494.329 690.658V744.39L241.493 690.658V744.39L-11.3428 690.658V744.036L-262.493 690.658V744.39L-515.329 690.658V744.39L-768.164 690.658V744.39L-1021 690.658V791.784L-768.164 845.515V791.784L-515.329 845.515V791.784L-262.493 845.515V791.784L-9.65723 845.515V792.138L241.493 845.515V791.784L494.329 845.515V791.784L747.164 845.515V791.784L1000 845.515V791.784L1252.84 845.515V791.784L1505.67 845.515V791.784L1758.51 845.515V791.784L2011.34 845.515V792.138L2262.49 845.515V791.784L2515.33 845.515V791.784L2768.16 845.515V791.784Z" fill="#1B1B1B" />'
                '<path d="M2768.16 946.387L3021 1000.14V899.01L2768.16 845.262V899.01L2515.33 845.262V899.01L2262.49 845.262V899.01L2009.66 845.262V898.639L1758.51 845.262V899.01L1505.67 845.262V899.01L1252.84 845.262V899.01L1000 845.262V899.01L747.164 845.262V899.01L494.329 845.262V899.01L241.493 845.262V899.01L-11.3428 845.262V898.639L-262.493 845.262V899.01L-515.329 845.262V899.01L-768.164 845.262V899.01L-1021 845.262V946.387L-768.164 1000.14V946.387L-515.329 1000.14V946.387L-262.493 1000.14V946.387L-9.65723 1000.14V946.758L241.493 1000.14V946.387L494.329 1000.14V946.387L747.164 1000.14V946.387L1000 1000.14V946.387L1252.84 1000.14V946.387L1505.67 1000.14V946.387L1758.51 1000.14V946.387L2011.34 1000.14V946.758L2262.49 1000.14V946.387L2515.33 1000.14V946.387L2768.16 1000.14V946.387Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1101L3021 1154.74V1053.61L2768.16 999.879V1053.61L2515.33 999.879V1053.61L2262.49 999.879V1053.61L2009.66 999.879V1053.26L1758.51 999.879V1053.61L1505.67 999.879V1053.61L1252.84 999.879V1053.61L1000 999.879V1053.61L747.164 999.879V1053.61L494.329 999.879V1053.61L241.493 999.879V1053.61L-11.3428 999.879V1053.26L-262.493 999.879V1053.61L-515.329 999.879V1053.61L-768.164 999.879V1053.61L-1021 999.879V1101L-768.164 1154.74V1101L-515.329 1154.74V1101L-262.493 1154.74V1101L-9.65723 1154.74V1101.36L241.493 1154.74V1101L494.329 1154.74V1101L747.164 1154.74V1101L1000 1154.74V1101L1252.84 1154.74V1101L1505.67 1154.74V1101L1758.51 1154.74V1101L2011.34 1154.74V1101.36L2262.49 1154.74V1101L2515.33 1154.74V1101L2768.16 1154.74V1101Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1255.61L3021 1309.34V1208.22L2768.16 1154.48V1208.22L2515.33 1154.48V1208.22L2262.49 1154.48V1208.22L2009.66 1154.48V1207.86L1758.51 1154.48V1208.22L1505.67 1154.48V1208.22L1252.84 1154.48V1208.22L1000 1154.48V1208.22L747.164 1154.48V1208.22L494.329 1154.48V1208.22L241.493 1154.48V1208.22L-11.3428 1154.48V1207.86L-262.493 1154.48V1208.22L-515.329 1154.48V1208.22L-768.164 1154.48V1208.22L-1021 1154.48V1255.61L-768.164 1309.34V1255.61L-515.329 1309.34V1255.61L-262.493 1309.34V1255.61L-9.65723 1309.34V1255.96L241.493 1309.34V1255.61L494.329 1309.34V1255.61L747.164 1309.34V1255.61L1000 1309.34V1255.61L1252.84 1309.34V1255.61L1505.67 1309.34V1255.61L1758.51 1309.34V1255.61L2011.34 1309.34V1255.96L2262.49 1309.34V1255.61L2515.33 1309.34V1255.61L2768.16 1309.34V1255.61Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1410.22L3021 1463.96V1362.84L2768.16 1309.09V1362.84L2515.33 1309.09V1362.84L2262.49 1309.09V1362.84L2009.66 1309.09V1362.47L1758.51 1309.09V1362.84L1505.67 1309.09V1362.84L1252.84 1309.09V1362.84L1000 1309.09V1362.84L747.164 1309.09V1362.84L494.329 1309.09V1362.84L241.493 1309.09V1362.84L-11.3428 1309.09V1362.47L-262.493 1309.09V1362.84L-515.329 1309.09V1362.84L-768.164 1309.09V1362.84L-1021 1309.09V1410.22L-768.164 1463.96V1410.22L-515.329 1463.96V1410.22L-262.493 1463.96V1410.22L-9.65723 1463.96V1410.59L241.493 1463.96V1410.22L494.329 1463.96V1410.22L747.164 1463.96V1410.22L1000 1463.96V1410.22L1252.84 1463.96V1410.22L1505.67 1463.96V1410.22L1758.51 1463.96V1410.22L2011.34 1463.96V1410.59L2262.49 1463.96V1410.22L2515.33 1463.96V1410.22L2768.16 1463.96V1410.22Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1564.84L3021 1618.57V1517.44L2768.16 1463.71V1517.44L2515.33 1463.71V1517.44L2262.49 1463.71V1517.44L2009.66 1463.71V1517.09L1758.51 1463.71V1517.44L1505.67 1463.71V1517.44L1252.84 1463.71V1517.44L1000 1463.71V1517.44L747.164 1463.71V1517.44L494.329 1463.71V1517.44L241.493 1463.71V1517.44L-11.3428 1463.71V1517.09L-262.493 1463.71V1517.44L-515.329 1463.71V1517.44L-768.164 1463.71V1517.44L-1021 1463.71V1564.84L-768.164 1618.57V1564.84L-515.329 1618.57V1564.84L-262.493 1618.57V1564.84L-9.65723 1618.57V1565.19L241.493 1618.57V1564.84L494.329 1618.57V1564.84L747.164 1618.57V1564.84L1000 1618.57V1564.84L1252.84 1618.57V1564.84L1505.67 1618.57V1564.84L1758.51 1618.57V1564.84L2011.34 1618.57V1565.19L2262.49 1618.57V1564.84L2515.33 1618.57V1564.84L2768.16 1618.57V1564.84Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1719.44L3021 1773.17V1672.05L2768.16 1618.31V1672.05L2515.33 1618.31V1672.05L2262.49 1618.31V1672.05L2009.66 1618.31V1671.69L1758.51 1618.31V1672.05L1505.67 1618.31V1672.05L1252.84 1618.31V1672.05L1000 1618.31V1672.05L747.164 1618.31V1672.05L494.329 1618.31V1672.05L241.493 1618.31V1672.05L-11.3428 1618.31V1671.69L-262.493 1618.31V1672.05L-515.329 1618.31V1672.05L-768.164 1618.31V1672.05L-1021 1618.31V1719.44L-768.164 1773.17V1719.44L-515.329 1773.17V1719.44L-262.493 1773.17V1719.44L-9.65723 1773.17V1719.79L241.493 1773.17V1719.44L494.329 1773.17V1719.44L747.164 1773.17V1719.44L1000 1773.17V1719.44L1252.84 1773.17V1719.44L1505.67 1773.17V1719.44L1758.51 1773.17V1719.44L2011.34 1773.17V1719.79L2262.49 1773.17V1719.44L2515.33 1773.17V1719.44L2768.16 1773.17V1719.44Z" fill="#1B1B1B" />'
                '<path d="M2768.16 1874.04L3021 1927.79V1826.66L2768.16 1772.92V1826.66L2515.33 1772.92V1826.66L2262.49 1772.92V1826.66L2009.66 1772.92V1826.29L1758.51 1772.92V1826.66L1505.67 1772.92V1826.66L1252.84 1772.92V1826.66L1000 1772.92V1826.66L747.164 1772.92V1826.66L494.329 1772.92V1826.66L241.493 1772.92V1826.66L-11.3428 1772.92V1826.29L-262.493 1772.92V1826.66L-515.329 1772.92V1826.66L-768.164 1772.92V1826.66L-1021 1772.92V1874.04L-768.164 1927.79V1874.04L-515.329 1927.79V1874.04L-262.493 1927.79V1874.04L-9.65723 1927.79V1874.41L241.493 1927.79V1874.04L494.329 1927.79V1874.04L747.164 1927.79V1874.04L1000 1927.79V1874.04L1252.84 1927.79V1874.04L1505.67 1927.79V1874.04L1758.51 1927.79V1874.04L2011.34 1927.79V1874.41L2262.49 1927.79V1874.04L2515.33 1927.79V1874.04L2768.16 1927.79V1874.04Z" fill="#1B1B1B" />'
                '<path d="M2768.16 2028.66L3021 2082.39V1981.27L2768.16 1927.54V1981.27L2515.33 1927.54V1981.27L2262.49 1927.54V1981.27L2009.66 1927.54V1980.91L1758.51 1927.54V1981.27L1505.67 1927.54V1981.27L1252.84 1927.54V1981.27L1000 1927.54V1981.27L747.164 1927.54V1981.27L494.329 1927.54V1981.27L241.493 1927.54V1981.27L-11.3428 1927.54V1980.91L-262.493 1927.54V1981.27L-515.329 1927.54V1981.27L-768.164 1927.54V1981.27L-1021 1927.54V2028.66L-768.164 2082.39V2028.66L-515.329 2082.39V2028.66L-262.493 2082.39V2028.66L-9.65723 2082.39V2029.02L241.493 2082.39V2028.66L494.329 2082.39V2028.66L747.164 2082.39V2028.66L1000 2082.39V2028.66L1252.84 2082.39V2028.66L1505.67 2082.39V2028.66L1758.51 2082.39V2028.66L2011.34 2082.39V2029.02L2262.49 2082.39V2028.66L2515.33 2082.39V2028.66L2768.16 2082.39V2028.66Z" fill="#1B1B1B" />'
                '</g>'
                '</svg>'
            )
        );
    }
}